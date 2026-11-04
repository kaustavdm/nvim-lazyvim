# Kaustav's LazyVim customizations

This repo is my personal customization layer built on top of [LazyVim](https://www.lazyvim.org).

It only documents and contains what differs from LazyVim defaults. For everything else, see the [LazyVim docs](https://www.lazyvim.org).

## Setup

Requirements: [Neovim](https://neovim.io) >= 0.12.6, `git`, a [Nerd Font](https://www.nerdfonts.com), and the other [LazyVim requirements](https://www.lazyvim.org/#%EF%B8%8F-requirements).

```sh
# Back up any existing config (optional)
mv ~/.config/nvim ~/.config/nvim.bak

git clone https://github.com/kaustavdm/nvim-lazyvim.git ~/.config/nvim
nvim
```

Plugins install on first launch. Run `:checkhealth` afterwards to verify.

## Customizations

### Language extras

Enabled on top of LazyVim's defaults (see [`lazyvim.json`](lazyvim.json) and the [extras docs](https://www.lazyvim.org/extras)):

Go, JSON, Markdown, Python, Rust, SQL, TOML, TypeScript, YAML.

### Theme

[Catppuccin](https://github.com/catppuccin/nvim), `mocha` flavour, set in [`lua/plugins/colorscheme.lua`](lua/plugins/colorscheme.lua). Diagnostic underlines use undercurl, and the integrations for the plugins LazyVim ships are enabled. Bufferline picks up the Catppuccin theme.

### Markdown and text files

Prose buffers (`markdown`, `text`) are less noisy by default:

- **Diagnostics are off** ([`lua/config/autocmds.lua`](lua/config/autocmds.lua)).
- **Auto-completion is off** ([`lua/plugins/completion.lua`](lua/plugins/completion.lua)), via `blink.cmp`.

### Keymaps

Only keymaps added by this config are listed. For all others see the [LazyVim keymaps](https://www.lazyvim.org/keymaps).

| Key          | Action                                                                                  |
| ------------ | --------------------------------------------------------------------------------------- |
| `<leader>uk` | Toggle auto-completion in the current buffer (overrides the Markdown/text default)      |
| `<leader>uK` | Toggle auto-completion globally (also clears per-buffer overrides)                      |

Diagnostics can be re-enabled in a buffer with LazyVim's `<leader>ud`.
