#!/usr/bin/env bash
set -euo pipefail
source_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
bin_dir="${RUSTTRAN_INSTALL_BIN:-$HOME/.local/bin}"
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}"
marker="$data_dir/rusttran/install.marker"
if [[ ! -f "$marker" ]]; then
    for existing in "$bin_dir/rusttran" "$bin_dir/rusttran-cli" "$data_dir/applications/org.rusttran.RustTran.desktop" "$data_dir/icons/hicolor/scalable/apps/org.rusttran.RustTran.svg"; do
        if [[ -e "$existing" ]]; then printf 'Refusing to replace existing file: %s\n' "$existing" >&2; exit 1; fi
    done
fi
command -v python3 >/dev/null || { printf 'Python 3 is required for installation.\n' >&2; exit 1; }
mkdir -p "$bin_dir" "$data_dir/applications" "$data_dir/icons/hicolor/scalable/apps"
install -m755 "$source_dir/rusttran" "$bin_dir/rusttran"
install -m755 "$source_dir/rusttran-cli" "$bin_dir/rusttran-cli"
install -m644 "$source_dir/rusttran.svg" "$data_dir/icons/hicolor/scalable/apps/org.rusttran.RustTran.svg"
python3 - "$source_dir/org.rusttran.RustTran.desktop" "$data_dir/applications/org.rusttran.RustTran.desktop" "$bin_dir/rusttran" <<'PY'
import sys
from pathlib import Path
exe=sys.argv[3].replace('\\','\\\\\\\\').replace('"','\\"').replace('`','\\`').replace('$','\\$').replace('%','%%')
text=Path(sys.argv[1]).read_text().replace('Exec=rusttran','Exec="'+exe+'"')
Path(sys.argv[2]).write_text(text)
PY
command -v update-desktop-database >/dev/null && update-desktop-database "$data_dir/applications" || true
mkdir -p "$data_dir/rusttran"
printf 'rusttran-user-install-v1\n' > "$marker"
printf 'RustTran installed. Open RustTran from the application menu.\n'
