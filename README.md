# Fixes that worked for UMU offline startup issues

This repository contains local, non-invasive fixes, wrappers, and snippets you can apply to your local umu-launcher installation to avoid long startup delays when the network is in a "blackhole"/filtered state.

Files included:
- umu-proton-direct.sh — safe local wrapper to run Proton directly (bypass umu runtime)
- snippets/umu_run_bypass_snippet.txt — code snippet to add to umu/umu_run.py to bypass the steam runtime when UMU_NO_RUNTIME=1
- snippets/umu_connectivity_snippet.txt — code snippet to replace the UDP probe with a short TCP connect_ex probe and optional UMU_ASSUME_RUNTIME_READY opt-in
- snippets/umu_debug_capture_notes.txt — notes on UMU_DEBUG_CAPTURE and environment flags
- umu_proton_fix_note.txt — placeholder for your umu_proton.py final fix (paste your final diff here)
- README.md — this file

How to use
1. Pick the approach you prefer (safe wrapper OR local patches):
   - Wrapper (recommended, reversible): make `umu-proton-direct.sh` executable and point Lutris game's executable to it.
   - Patch files: copy snippets into the indicated places in `umu/umu_run.py` (backup the file first).

2. Example: enable opt-in assume-ready in Lutris (only if you know runtime is present):
   UMU_ASSUME_RUNTIME_READY=1

3. If you want me to create a git patch instead, tell me and I will generate a unified diff you can apply with `git apply`.

Notes
- These fixes are intentionally small and local; prefer the wrapper if you don't want to edit installed files.
- Keep a backup of any file you edit (e.g. `cp umu/umu_run.py umu/umu_run.py.bak`).
- The snippets intentionally perform a conservative local runtime check before skipping network setup.
