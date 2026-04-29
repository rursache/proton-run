<p align="center">
  <img src="assets/icon_white.svg" width="100" height="100" alt="proton-run">
</p>

<h1 align="center">proton-run</h1>

<p align="center">
  Run Windows executables with Steam Proton outside of Steam
</p>

<p align="center">
  <a href="https://aur.archlinux.org/packages/proton-run">
    <img src="https://img.shields.io/aur/version/proton-run" alt="AUR version">
  </a>
  <a href="https://github.com/rursache/proton-run/releases">
    <img src="https://img.shields.io/github/v/release/rursache/proton-run" alt="GitHub release">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/rursache/proton-run" alt="License">
  </a>
</p>

---

## Features

- **Auto-detects Proton** — finds the best available Proton version from your Steam installation
- **Desktop integration** — right-click any `.exe` and open it with Proton Run
- **YAML configuration** — customize Proton version, DLL overrides, prefix paths, and more
- **Per-game prefixes** — isolate Wine prefixes per game using Steam App ID detection (`steam_appid.txt`, `OnlineFix.ini`, `steamclient64.ini`/`steamclient.ini`)
- **Config migration** — new config options are automatically added on updates without overwriting your changes
- **MangoHud support** — toggle the FPS/stats overlay from the config
- **Proton version override** — select a specific Proton version per run via CLI
- **Available Proton listing** — shows installed Proton versions when a match isn't found

## Installation

### AUR (Arch Linux)

```bash
yay -S proton-run
```

### Manual

```bash
git clone https://github.com/rursache/proton-run.git
cd proton-run
sudo make install
```

### Dependencies

- `bash`
- `steam` (provides Proton)
- `yq` (YAML parser)

## Usage

```bash
# Run a Windows executable
proton-run game.exe

# Force a specific Steam App ID (uses Steam's compatdata prefix)
proton-run --steam-id 4069520 game.exe

# Override Proton version for this run
proton-run --proton "GE-Proton*" game.exe

# Enable per-game prefix for this run
proton-run --per-game-prefix game.exe

# Open the configuration file
proton-run --config

# Open the default Wine prefix's C: drive in your file manager
proton-run --open-prefix

# Show help
proton-run --help
```

You can also right-click any `.exe` file in your file manager and select **Open With > Proton Run**.

## Configuration

The configuration file is created automatically on first run at:

```
~/.config/proton-run.yaml
```

Edit it directly or use `proton-run --config` to open it in your default editor.

### Options

| Option | Default | Description |
|--------|---------|-------------|
| `proton_version` | `auto` | Proton version to use. Set to `auto` for auto-detection or an absolute path to a specific Proton |
| `proton_preferences` | *(see below)* | Search order for auto-detection (first match wins) |
| `proton_search_dirs` | `~/.steam`, `~/.local/share/Steam` | Directories to scan for Proton installations |
| `mangohud` | `false` | Enable MangoHud overlay (FPS, CPU/GPU stats) |
| `protonhax` | `false` | Enable protonhax for running additional programs inside the Proton prefix (falls back to classic launch if not installed) |
| `per_game_prefix` | `false` | Use per-game Wine prefixes based on detected Steam App ID |
| `wine_prefix` | `~/.proton_pfx` | Shared Wine prefix path (fallback when per-game is off or no ID is found) |
| `steam_compat_client_install_path` | `~/.local/share/Steam` | Steam install path |
| `dll_overrides` | *(see below)* | Wine DLL overrides (`=n,b` is added automatically) |

### Default Proton search order

```yaml
proton_preferences:
  - "Proton - Experimental"
  - "Proton Hotfix"
  - "Proton 9*"
  - "GE-Proton*"
  - "Proton-GE*"
  - "Proton-EM*"
  - "Proton 8*"
  - "Proton*"
```

### Default DLL overrides

```yaml
dll_overrides:
  - "steam_api"
  - "steam_api64"
  - "OnlineFix"
  - "OnlineFix64"
  - "SteamOverlay"
  - "SteamOverlay64"
  - "Custom"
  - "steamclient"
  - "steamclient64"
  - "winmm"
  - "version"
  - "GameAssembly"
```

### Per-game prefixes

When `per_game_prefix` is enabled, proton-run scans the game's directory for:

1. **`steam_appid.txt`** — a file containing the Steam App ID
2. **`OnlineFix.ini`** — extracts the ID from `RealAppId=<id>`
3. **`steamclient64.ini`** / **`steamclient.ini`** — extracts the ID from `AppId=<id>`

The detected ID is used to create an isolated prefix at `~/.local/share/Steam/steamapps/compatdata/<id>/`, matching Steam's own behavior.

You can also force an ID with `--steam-id <id>` regardless of the config setting.

## Browsing the Wine prefix

Files installed inside the Wine prefix live under `<wine_prefix>/pfx/drive_c/` on the host filesystem (e.g. `~/.proton_pfx/pfx/drive_c/Program Files/`). Use:

```bash
proton-run --open-prefix
```

to open the default prefix's C: drive in your file manager. For per-game prefixes, the path is `~/.local/share/Steam/steamapps/compatdata/<id>/pfx/drive_c/`.

## License

[MIT](LICENSE)
