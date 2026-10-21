#!/usr/bin/env bash
# Install/update the latest packaged RustTran release for the current user.
set -euo pipefail
repo="${RUSTTRAN_REPO:-p01t3rge1st/RustTran}"
release_tag=""
while (($#)); do
    case "$1" in
        --version)
            [[ $# -ge 2 && -n "$2" ]] || { echo 'Usage: install.sh [--version RELEASE_TAG]' >&2; exit 2; }
            release_tag="$2"; shift 2 ;;
        --help|-h)
            echo 'Usage: install.sh [--version RELEASE_TAG]'
            echo 'Installs the latest release by default. Run again to update.'
            echo 'Private repository: first run gh auth login.'
            exit 0 ;;
        *) printf 'Unknown argument: %s\n' "$1" >&2; exit 2 ;;
    esac
done
[[ "$(uname -s)" == Linux ]] || { echo 'This installer supports Linux. Download RustTran.exe for Windows from Releases.' >&2; exit 1; }
case "$(uname -m)" in
    x86_64|amd64) asset='rusttran-linux-x86_64.tar.gz' ;;
    *) echo 'This release supports Linux x86_64 only.' >&2; exit 1 ;;
esac
for tool in python3 mktemp install; do
    command -v "$tool" >/dev/null || { printf 'Required command missing: %s\n' "$tool" >&2; exit 1; }
done
# Check before downloads; the current Linux binaries target glibc 2.28.
if ! libc="$(getconf GNU_LIBC_VERSION 2>/dev/null)"; then
    echo 'A glibc-based Linux distribution is required (glibc 2.28 or newer).' >&2; exit 1
fi
libc_version="${libc##* }"
IFS=. read -r libc_major libc_minor _ <<< "$libc_version"
if ((libc_major < 2 || (libc_major == 2 && libc_minor < 28))); then
    printf 'glibc 2.28 or newer is required; found %s.\n' "$libc_version" >&2; exit 1
fi
use_gh=false
if command -v gh >/dev/null && gh auth status --hostname github.com >/dev/null 2>&1; then
    use_gh=true
else
    command -v curl >/dev/null || { echo 'Install curl, or install GitHub CLI and run gh auth login.' >&2; exit 1; }
fi
task_tmp="$(mktemp -d "${TMPDIR:-/tmp}/rusttran-install.XXXXXXXX")"
trap 'rm -rf -- "$task_tmp"' EXIT
if "$use_gh"; then
    if [[ -z "$release_tag" ]]; then
        release_tag="$(gh api --hostname github.com "repos/$repo/releases/latest" --jq .tag_name)" || {
            echo 'Cannot find a release. Check repository access and gh auth status.' >&2; exit 1;
        }
    fi
    gh release download "$release_tag" --repo "github.com/$repo" --pattern "$asset" --pattern SHA256SUMS --dir "$task_tmp"
else
    base_url="https://github.com/$repo/releases/latest/download"
    if [[ -n "$release_tag" ]]; then base_url="https://github.com/$repo/releases/download/$release_tag"; fi
    for name in "$asset" SHA256SUMS; do
        curl --fail --silent --show-error --location --proto '=https' --tlsv1.2 --retry 3 "$base_url/$name" --output "$task_tmp/$name" || {
            echo 'Download failed. For a private repository, install gh and run gh auth login first.' >&2; exit 1;
        }
    done
fi
# Verify the selected asset and extract only ordinary files within its package.
python3 - "$task_tmp" "$asset" <<'PY'
import hashlib, pathlib, re, sys, tarfile
folder=pathlib.Path(sys.argv[1]);name=sys.argv[2];archive=folder/name
matches=[]
for line in (folder/'SHA256SUMS').read_text().splitlines():
    parts=line.split()
    if len(parts)==2 and parts[1].lstrip('*')==name:
        matches.append(parts[0])
if len(matches)!=1 or not re.fullmatch('[0-9a-fA-F]{64}',matches[0]):
    sys.exit('Release checksum is missing or ambiguous.')
digest=hashlib.sha256()
with archive.open('rb') as stream:
    for block in iter(lambda:stream.read(1024*1024),b''):digest.update(block)
if digest.hexdigest()!=matches[0].lower():sys.exit('Checksum mismatch; no files installed.')
with tarfile.open(archive,'r:gz') as package:
    members=package.getmembers()
    for member in members:
        path=pathlib.PurePosixPath(member.name)
        if path.is_absolute() or '..' in path.parts or not path.parts or path.parts[0]!='rusttran-linux-x86_64' or not (member.isfile() or member.isdir()):
            sys.exit('Invalid package entry; no files installed.')
        member.mode &= 0o777
    # Symlinks, hardlinks, special files and escaping paths were rejected above.
    package.extractall(folder, members=members)
PY
package_dir="$task_tmp/rusttran-linux-x86_64"
for name in rusttran rusttran-cli install.sh rusttran.svg org.rusttran.RustTran.desktop; do
    [[ -f "$package_dir/$name" ]] || { printf 'Package is missing %s; no files installed.\n' "$name" >&2; exit 1; }
done
# Detect binary/runtime incompatibility before replacing an existing installation.
"$package_dir/rusttran-cli" --help >/dev/null
bash "$package_dir/install.sh"
printf 'RustTran installed from %s (%s).\n' "$repo" "${release_tag:-latest}"
echo 'Run this installer again to update to the latest release.'
