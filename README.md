# mapper.nvim - A Simple Keymap Manager for Neovim

A minimalist approach to organizing Neovim keymaps. Made this for personal use, so use at your own risk!

⚠️ **Warning**: This is a very basic plugin made for personal use. It's not necessary for most users as Neovim's built-in mapping system works perfectly fine!

## Installation

### Lazy.nvim
```lua
{
    'DeciStudios/mapper.nvim',
    config = function()
        require('mapper').setup({
            navigation = {
                n = {
                    ["<C-h>"] = { "<C-w>h", "Move to left split" },
                    ["<C-l>"] = { "<C-w>l", "Move to right split" },
                }
            },
            files = {
                n = {
                    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
                    ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
                }
            }
        })
    end
}
```

### Packer.nvim
```lua
use {
    'DeciStudios/mapper.nvim',
    config = function()
        require('mapper').setup({
            navigation = {
                n = {
                    ["<C-h>"] = { "<C-w>h", "Move to left split" },
                    ["<C-l>"] = { "<C-w>l", "Move to right split" },
                }
            },
            files = {
                n = {
                    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
                    ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
                }
            }
        })
    end
}
```

### Vim-Plug
```vim
Plug 'DeciStudios/mapper.nvim'

lua << EOF
require('mapper').setup({
    navigation = {
        n = {
            ["<C-h>"] = { "<C-w>h", "Move to left split" },
            ["<C-l>"] = { "<C-w>l", "Move to right split" },
        }
    },
    files = {
        n = {
            ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
            ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
        }
    }
})
EOF
```

## Usage

The plugin provides a simple way to organize your keymaps into categories. Each mapping follows this structure:
```lua
category = {
    mode = {
        key = { action, description }
    }
}
```

You can view your mappings using the `:MapperOutput` command. Optionally specify a category:
```vim
:MapperOutput         " Show all mappings
:MapperOutput files   " Show only 'files' category mappings
```

To add mappings after initial setup:
```lua
require('mapper').add_mappings({
    new_category = {
        n = {
            ["<leader>x"] = { "<cmd>Something<CR>", "Do something" }
        }
    }
})
```

## Configuration

Basic setup example:
```lua
require('mapper').setup({
    navigation = {
        n = {
            ["<C-h>"] = { "<C-w>h", "Move to left split" },
            ["<C-l>"] = { "<C-w>l", "Move to right split" },
        }
    },
    files = {
        n = {
            ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
            ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
        }
    }
})
```

## Companion Plugin

There's a companion cheatsheet plugin available at [DeciStudios/mapper-cheatsheet.nvim](https://github.com/DeciStudios/mapper-cheatsheet.nvim) that automatically generates a searchable cheatsheet from your mapper.nvim configurations. If both plugins are installed, the cheatsheet functionality will be automatically enabled.

## Why?

I wanted a more structured way to organize my keymaps and their descriptions. While Neovim's built-in `vim.keymap.set()` works perfectly fine, this helps me keep things organized by category and makes it easier to view all mappings at once.

## Known Issues

- Currently doesn't handle complex mapping options beyond basic descriptions
- Probably other issues I haven't found yet

This is mainly for personal use, so it's intentionally simple!

## License

MIT - Do whatever you want with it!
