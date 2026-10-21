# RustTran releases

`install.sh` at the repository root installs or updates the most recent published
release for Linux x86_64, glibc >=2.28. It uses authenticated GitHub CLI when
available, otherwise public HTTPS downloads. A private repository needs GitHub
access and `gh auth login`. It never changes repository visibility.

```sh
gh api --hostname github.com -H 'Accept: application/vnd.github.raw+json' repos/p01t3rge1st/RustTran/contents/install.sh | bash
```

The downloaded archive contains the existing per-user installer. Executables go
to `${RUSTTRAN_INSTALL_BIN:-$HOME/.local/bin}` and the desktop file/icon to
`${XDG_DATA_HOME:-$HOME/.local/share}`. Checksums, archive paths and binary startup
are checked before invoking installation. An existing unowned executable is not
overwritten. Running the command again updates an existing RustTran installation.

A downloaded copy of the installer accepts `--version RELEASE_TAG` for a specific
release. Source compilation is not required. Unsupported architectures and
non-glibc Linux are explicitly rejected; no ARM build is currently published.

## Automatic builds

`.github/workflows/release.yml` runs after relevant source/package changes on
`main`, or via **Actions → Build and publish latest → Run workflow**.

- Linux: test the recovered engine and installer, then build GUI/CLI with
  cargo-zigbuild for glibc 2.28. Package the archive and Debian package.
- Windows: build x86_64 MSVC GUI/CLI with static CRT and run CLI help.
- Publish only when both jobs succeed. Each build gets a distinct tag
  `build-RUN_NUMBER-COMMIT`; it becomes the latest release. Existing releases
  are retained. Download metadata fixes the selected release tag for private
  downloads, so a concurrent publication cannot mix that tag's two files.

The Linux tests use stored fixtures and do not need the original PCTran binary.
Windows CLI smoke is not a Windows GUI or whole-scenario equivalence test.
Builds remain partial reconstructions; publishing is not a readiness claim.

## Assets

- `rusttran-linux-x86_64.tar.gz`: Linux GUI, CLI, desktop integration, examples.
- `rusttran_VERSION_amd64.deb`: Debian/Ubuntu system package.
- `RustTran.exe`, `RustTran-cli.exe`: standalone Windows executables.
- `rusttran-windows-x86_64.zip`: Windows executables with examples/documentation.
- `install.sh`, `BUILD_INFO.json`, `SHA256SUMS`.

The manifest uses asset basenames, independently of local `dist/` paths.
`BUILD_INFO.json` records the source commit and package version.

## Local packaging / first release

After building both targets and the Linux package:

```sh
python3 scripts/package_release.py --target x86_64-unknown-linux-gnu
python3 scripts/package_release_assets.py --platform all
python3 scripts/test_release_installer.py
```

For native Windows builds pass `--windows-target x86_64-pc-windows-msvc`.
Upload `dist/release-assets/*` using `gh release create TAG ... --target COMMIT
--latest`. The initial local release uses the already validated Linux/GNU Windows
binaries; subsequent CI builds compile from the tagged source.

Seven offline tests cover private and public download paths, update, desktop
integration, bad checksums, unsafe archive entries, failed downloads, unowned
files and unsupported CPU. A real GitHub download/install is checked separately
in isolated installation directories before claiming the copyable command works.
