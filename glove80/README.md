# Glove80 Keyboard Layout

This directory contains the firmware layout for the MoErgo Glove80 keyboard.

## Flashing Instructions

1. Put the keyboard into bootloader mode:
   - Unplug the keyboard
   - Hold the top-left key (Escape position) on the left half
   - Plug in the USB cable while holding the key
   - The keyboard should mount as a USB drive

2. Flash the layout:
   ```bash
   cp ~/dotfiles/glove80/layout.uf2 /Volumes/GLV80LHBOOT/
   ```

3. The keyboard will automatically reboot with the new layout

## Files

- `layout.uf2` - Compiled firmware layout (version 25.08, MacOS L4 iteration 3)

## Notes

- This file is **not managed by Stow** (excluded in `.stow-local-ignore`)
- Keep this file version controlled for backup purposes
- Generate new layouts at: https://my.glove80.com/
