![Darcula-solid.nvim](https://raw.githubusercontent.com/briones-gabriel/darcula-solid.nvim/main/resources/darcula-solid-logo.png)
# Darcula-solid.nvim
A high-fidelity Neovim color scheme that perfectly matches the official JetBrains Darcula theme. Built with [Lush](https://github.com/rktjmp/lush.nvim) for easy customization and comprehensive plugin support.

## ✨ Features
* **Pixel-perfect JetBrains Darcula colors** - Official color palette from IntelliJ IDEA
* **Full nvim-treesitter compatibility** - Complete support for all modern Tree-sitter capture groups
* **LSP Semantic Tokens** - Enhanced highlighting with italic/bold modifiers for static, abstract, and readonly
* **Extensive plugin support** - 20+ popular plugins themed out of the box
* **256 colors** - Full true color support
* **Backward compatible** - Legacy Tree-sitter groups maintained for older versions

## 🎨 Supported Plugins
* **Completion**: [blink.cmp](https://github.com/Saghen/blink.cmp), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* **File Explorers**: [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua), [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
* **Fuzzy Finder**: [Telescope](https://github.com/nvim-telescope/telescope.nvim)
* **Git**: [GitSigns](https://github.com/lewis6991/gitsigns.nvim), [Neogit](https://github.com/TimUntersberger/neogit)
* **UI**: [Noice](https://github.com/folke/noice.nvim), [Bufferline](https://github.com/akinsho/bufferline.nvim), [Which-Key](https://github.com/folke/which-key.nvim)
* **Utilities**: [Lazy](https://github.com/folke/lazy.nvim), [Mason](https://github.com/williamboman/mason.nvim), [Trouble](https://github.com/folke/trouble.nvim)
* **Navigation**: [Hop](https://github.com/phaazon/hop.nvim), [Leap](https://github.com/ggandor/leap.nvim)
* **Notifications**: [nvim-notify](https://github.com/rcarriga/nvim-notify)
* **Indentation**: [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
* **Dashboard**: [alpha-nvim](https://github.com/goolord/alpha-nvim)

## ⚡ Requirements
* Neovim 0.8+ (recommended 0.9+)
* `termguicolors` enabled for true color support
* (recommended) [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for enhanced syntax highlighting
* (recommended) LSP server for semantic token highlighting

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)
```lua
{
  "briones-gabriel/darcula-solid.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  priority = 1000, -- Load before other plugins
  config = function()
    vim.cmd("colorscheme darcula-solid")
  end,
}
```

### [Packer](https://github.com/wbthomason/packer.nvim)
```lua
use {
  "briones-gabriel/darcula-solid.nvim",
  requires = "rktjmp/lush.nvim"
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'rktjmp/lush.nvim'
Plug 'briones-gabriel/darcula-solid.nvim'
```

## 🔧 Configuration

### Basic Setup
```lua
-- init.lua
vim.opt.termguicolors = true
vim.cmd("colorscheme darcula-solid")
```

Or in Vimscript:
```vim
" init.vim
set termguicolors
colorscheme darcula-solid
```

### LSP Semantic Highlighting
For the best experience with semantic tokens (italic static/abstract members, etc.):
```lua
-- Ensure your LSP is configured to enable semantic tokens
-- Most LSP servers enable this by default
```

## 🎨 Color Palette
The theme uses the official JetBrains Darcula colors:

| Element | Color | Hex |
|---------|-------|-----|
| Background | Dark Gray | `#2B2B2B` |
| Foreground | Light Gray-Blue | `#A9B7C6` |
| Keywords | Orange | `#CC7832` |
| Strings | Green | `#6A8759` |
| Numbers | Blue | `#6897BB` |
| Comments | Gray | `#808080` |
| Functions | Yellow | `#FFC66D` |
| Types/Classes | Teal-Blue | `#769AA5` |
| Constants | Purple | `#9876AA` |
| Annotations | Olive-Yellow | `#BBB529` |

## 🛠️ Customization
Because the theme is built with [Lush](https://github.com/rktjmp/lush.nvim), you can easily customize it to your preferences:

1. Create a `colors` directory: `~/.config/nvim/colors`
2. Create a custom theme file: `~/.config/nvim/colors/darcula-solid-custom.lua`
3. Extend the base theme:

```lua
vim.opt.background = 'dark'
vim.g.colors_name = 'darcula-solid-custom'

local lush = require('lush')
local darcula_solid = require('lush_theme.darcula-solid')
local spec = lush.extends({darcula_solid}).with(function()
  -- Your modifications go here
  local yellow = lush.hsl(37, 100, 71)

  return {
    -- Override specific highlight groups
    Type { fg = yellow },
    Function { fg = darcula_solid.Normal.fg },
    -- Add more customizations...
  }
end)

lush(spec)
```

4. Apply your custom theme:
```lua
vim.cmd("colorscheme darcula-solid-custom")
```

## 🌟 Highlights

### Tree-sitter Support
Full support for all modern nvim-treesitter capture groups including:
- All `@keyword.*` variants (coroutine, import, type, modifier, etc.)
- Complete `@markup.*` groups for Markdown and other markup languages
- `@diff.*` groups for version control
- LSP semantic tokens with modifiers (static, abstract, readonly, deprecated)

### Italic & Bold Refinements
Following JetBrains conventions:
- **Bold** keywords for better visibility
- **Italic** for static members, abstract classes, and readonly properties
- **Italic** documentation comments
- **Strikethrough** for deprecated items

## 🐛 Troubleshooting

If certain elements aren't highlighting correctly (e.g., `this` keyword appears purple instead of orange, or Angular components appear white), see [DEBUGGING.md](DEBUGGING.md) for detailed troubleshooting steps.

**Quick fixes:**
1. Reload the theme: `:colorscheme darcula-solid`
2. Check what highlight is applied: `:Inspect` (cursor on element)
3. Ensure tree-sitter parsers are installed: `:TSInstall typescript javascript html`
4. Restart LSP: `:LspRestart`

## 🙏 Credits
- Original theme inspired by the official JetBrains Darcula theme
- Thanks to [@rorystephenson](https://github.com/rorystephenson) for the customization idea
- Built with [Lush](https://github.com/rktjmp/lush.nvim) by [@rktjmp](https://github.com/rktjmp)

## Preview
![darcula-solid](https://raw.githubusercontent.com/briones-gabriel/darcula-solid.nvim/main/resources/darcula-solid-example.png)
