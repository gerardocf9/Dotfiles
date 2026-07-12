# CLAUDE.md

Personal **dotfiles** repo for a Linux (Ubuntu 24 + Wayland/Sway) workstation.
Not an application — no build, no tests. Files here are copies of configs that
live under `~` and `~/.config`; editing a file here does **not** deploy it. The
user syncs manually (there is no symlink/stow automation in the repo).

## Layout

| Path | Deploys to | Purpose |
|------|-----------|---------|
| `.bashrc` | `~/.bashrc` | shell: prompt, aliases, PATH, lazy-load nvm, Go/tex helper funcs |
| `.dir_colors` | `~/.dir_colors` | `ls`/`dircolors` palette |
| `alacritty/alacritty.toml` | `~/.config/alacritty/` | terminal config |
| `alacritty/slot.sh` | — | launches Alacritty on the lowest free `term:N` Sway mark (per-terminal history slots) |
| `nvim/` | `~/.config/nvim/` | Neovim config (see below) |
| `sway/config` | `~/.config/sway/` | Sway WM |
| `waybar/{config,style.css}` | `~/.config/waybar/` | status bar |
| `scripts/` | user's `~/bin` / manual | LaTeX + Penta-docs project generators |
| `ssh-agent.{service,socket}` | `~/.config/systemd/user/` | systemd user ssh-agent (see `README.md`) |
| `guardarEstado.sh` | — | logs per-CPU usage via `sar` to `~/usocpu.log` |
| `fondo.png` | — | wallpaper |

## Neovim (`nvim/`)

- Entry `nvim/init.lua` requires modules under `lua/gerardocf9/` in order:
  `settings → plugins → plugin-config → keybinds → lsp-config → autocmd`.
- Plugin manager is **packer.nvim** (`plugins.lua`, bootstraps itself on first run).
  After editing plugin list run `:PackerSync`. `plugin/packer_compiled.lua` is generated — do not hand-edit.
- `nvim/antiguoNvim/` = old vim config kept for reference. Ignore unless asked.
- `nvim/UltiSnips/` = snippets (cpp, go, html, markdown, tex).

## Scripts (`scripts/`)

- `create-tex-project.sh <nombre>` / `create-tex-slide.sh` — scaffold a LaTeX project; **curl `main.tex`/`referencias.bib` from this repo's GitHub raw URL** (`gerardocf9/Dotfiles` `main` branch), so changes to those templates must be pushed to take effect.
- `pentaDoc/create-penta-docs.sh <nombre> <titulo>` — copies `pentaDoc/main.tex` from the **absolute path** `/home/gerardo/Dotfiles/scripts/pentaDoc/` and `sed`-substitutes title/name. Path is hardcoded.

## Conventions

- Comments and script prompts are in **Spanish**. Match that when editing.
- `.codegraph/` is a local index (SQLite + logs), self-`.gitignore`d — never commit or edit its contents.
- `*.bak` files (e.g. `alacritty.toml.0cb94c05.bak`, `lsp-config.lua.bak`) are manual backups; leave them.

## Git (from global user rules)

- Never create branches — commit to the current branch (`main`).
- Commit/push only when asked. Plain commit messages, no `Co-Authored-By` / "Generated with" trailers.
