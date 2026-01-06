# Battery TUI (dialog)

A clean, minimal **terminal battery monitor** for Arch / Omarchy systems.

Built with:
- POSIX shell
- `dialog` (ncurses)
- `upower` (preferred)

---

## Features

- Live updating battery gauge
- Nerd Font icons (auto-fallback)
- ESC / CTRL+C clean exit
- No background services
- Works in TTY, SSH, Wayland terminals

---

## Dependencies

```bash
sudo pacman -S dialog upower nerd-fonts
```

## Run
```bash
./battery-tui.sh
```
