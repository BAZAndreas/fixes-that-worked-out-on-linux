#!/bin/sh
# umu-proton-direct.sh — local wrapper to run a Proton runner directly (bypass pressure-vessel)
# Usage: point Lutris executable to this script or run it from terminal.
# Edit PROTON and GAME_EXE below if your paths differ.

PROTON="/home/baz/.local/share/lutris/runners/wine/GE-Proton10-34/proton"
# If you want to pass the game path via argv, set GAME_EXE to empty and pass it as $1.
GAME_EXE="/mnt/WD_HDD/GOG Games/Unreal Tournament III/Binaries/UT3.exe"

# Preserve relevant env defaults (adjust as needed)
export WINEPREFIX="${WINEPREFIX:-$HOME/Games/umu/umu-default}"
export STEAM_COMPAT_INSTALL_PATH="${STEAM_COMPAT_INSTALL_PATH:-$(dirname "$GAME_EXE") }"

# Make umu-run think runtime update/discovery is disabled (avoid network probing)
export UMU_NO_RUNTIME=1
export UMU_RUNTIME_UPDATE=0
export UMU_HTTP_TIMEOUT=1
export UMU_HTTP_RETRIES=0

# If you want to override PROTONPATH for other scripts, keep it set too
export PROTONPATH="${PROTONPATH:-/home/baz/.local/share/lutris/runners/wine/GE-Proton10-34}"

# If you saved this wrapper as a general-purpose launcher, allow passing a different exe
if [ -n "$1" ]; then
  exec "$PROTON" run "$1" "${@:2}"
else
  exec "$PROTON" run "$GAME_EXE" "${@:1}"
fi
