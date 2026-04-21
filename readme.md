my personal Neovim configuration built for speed and a distraction-free environment. Optimized for **Linux** with a focus on **Bash**, **Python**, and **Java** development

## features
* packer
* catppuccin (macchiato) with transparent background
* mason for automated server management & Conform for formatting
* treesitter for highlighting
* telescope for files, git, and grep
* harpoon for file switching 
* undotree for visual history

## structure
the configuration is modularly split to keep the logic separated from the settings
```text
.
├── init.lua          # entry point
└── lua
    ├── core
    │   ├── init.lua    # options & autocommands
    │   ├── packer.lua  # plugin definitions
    │   └── remaps.lua  # centralized keybinds (the source of truth)
    └── plugins
        ├── alpha.lua   # custom dashboard
        ├── mason.lua   # lsp, cmp & formatting
        └── ...         # plugin-specific setups
```

## keybindings

all custom remaps are centralized in `lua/core/remaps.lua`. The `<leader>` key is set to `space`.

### general
| key | action | mode |
| :--- | :--- | :--- |
| `<leader>pv` | open netrw file explorer | `normal` |
| `<Esc>` | exit terminal mode | `terminal` |

### telescope
| key | action | mode |
| :--- | :--- | :--- |
| `<leader>ff` | find files in project | `normal` |
| `<C-p>` | find git files | `normal` |
| `<leader>gs` | grep search (live grep) | `normal` |

### harpoon
| key | action | mode |
| :--- | :--- | :--- |
| `<leader>a` | mark current file | `normal` |
| `<C-e>` | toggle quick menu | `normal` |
| `<C-h>` | go to 1st file | `normal` |
| `<C-j>` | go to 2nd file | `normal` |
| `<C-k>` | go to 3rd file | `normal` |
| `<C-l>` | go to 4th file | `normal` |

### undotree
| key | action | mode |
| :--- | :--- | :--- |
| `<leader>u` | toggle undotree visualization | `normal` |

### LSP
| key | action | mode |
| :--- | :--- | :--- |
| `gd` | go to definition | `normal` |
| `K` | show hover documentation | `normal` |
| `<leader>vws` | search workspace symbols | `normal` |
| `<leader>e` | open diagnostic float | `normal` |
| `[d` | next diagnostic | `normal` |
| `]d` | previous diagnostic | `normal` |
| `<leader>vca` | show code actions | `normal` |
| `<leader>vrr` | list references | `normal` |
| `<leader>vrn` | rename symbol | `normal` |
| `<C-h>` | show signature help | `insert` |

### completion (nvim-cmp)
| key | action |
| :--- | :--- |
| `<C-p>` | select previous item |
| `<C-n>` | select next item |
| `<C-y>` / `<CR>` | confirm selection |
| `<C-Space>` | trigger completion menu |

## installation
1. clone into `~/.config/nvim`
2. ensure you have a **Nerd Font** installed for icons
3. install **Packer**:
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```
4. run `:PackerSync` inside nvim.
