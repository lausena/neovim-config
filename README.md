# Neovim Config

Personal Neovim setup built on **NvChad v2.5** with **Lazy.nvim** as the plugin manager.

**Theme:** ayu_dark

## Focus

Primarily a Rust development environment with debugging, testing, and AI-assisted coding.

## Key Plugins

| Category | Plugins |
|----------|---------|
| Rust | rustaceanvim, rust.vim, crates.nvim |
| Debugging | nvim-dap, nvim-dap-ui |
| Testing | vim-test, vimux |
| AI | copilot.lua, claude-code.nvim |
| Navigation | telescope.nvim, nvim-tree, vim-tmux-navigator |
| LSP/Format | nvim-lspconfig, conform.nvim, mason.nvim |
| Completion | nvim-cmp, LuaSnip, friendly-snippets |

## Keybindings

Leader key: `<Space>`

| Shortcut | Action |
|----------|--------|
| `;` | Command mode |
| `jk` | Escape (insert mode) |
| `Ctrl+h/j/k/l` | Tmux/split navigation |
| **Cargo** | |
| `<Leader>cr` | cargo run |
| `<Leader>cb` | cargo build |
| `<Leader>ct` | cargo test |
| **Testing** | |
| `<Leader>t` | Test nearest |
| `<Leader>T` | Test file |
| `<Leader>a` | Test suite |
| **Debugger** | |
| `<Leader>dc` | Continue |
| `<Leader>db` | Toggle breakpoint |
| `<Leader>dd` | Set conditional breakpoint |
| `<Leader>dl` | Step into |
| `<Leader>dj` | Step over |
| `<Leader>dk` | Step out |
| `<Leader>dr` | Run last |
| `<Leader>de` | Terminate |
| `<Leader>dt` | RustLsp testables |

## LSP

Configured servers: `html`, `cssls`, Rust via rustaceanvim.

Formatter: `stylua` (Lua), `rustfmt` (Rust, auto-save).

## Structure

```
lua/
├── chadrc.lua            # NvChad theme/UI config
├── mappings.lua          # Custom keybindings
├── configs/
│   ├── conform.lua       # Formatter setup
│   └── lspconfig.lua     # LSP servers
└── plugins/
    ├── init.lua           # Plugin specs
    ├── vim-test.lua
    ├── vimux.lua
    └── nvim-tmux-navigator.lua
```
