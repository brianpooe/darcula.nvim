# Darcula.nvim

> A pixel-perfect Neovim port of the iconic JetBrains Darcula theme

[![Neovim](https://img.shields.io/badge/Neovim-0.8+-green.svg?style=flat-square&logo=Neovim&logoColor=white)](https://neovim.io)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](LICENSE)

<p align="center">
  <img src="https://raw.githubusercontent.com/briones-gabriel/darcula-solid.nvim/main/resources/darcula-logo.png" alt="Darcula.nvim" />
</p>

High-fidelity color scheme that matches the official JetBrains Darcula theme. Built with [Lush](https://github.com/rktjmp/lush.nvim) for extensibility and comprehensive plugin support.

## ✨ Features

- 🎨 **Pixel-perfect colors** - Official JetBrains Darcula palette from IntelliJ IDEA
- 🌳 **Full Tree-sitter support** - Complete coverage of modern capture groups
- 🔍 **LSP Semantic Tokens** - Rich highlighting with italic/bold modifiers
- 🔌 **20+ plugin integrations** - Popular plugins themed out of the box
- 🎯 **True color** - Full 24-bit color support
- ⚡ **Fast** - Optimized for performance
- 🛠️ **Customizable** - Easy to extend with Lush

## 📸 Preview

<p align="center">
  <img src="https://raw.githubusercontent.com/briones-gabriel/darcula-solid.nvim/main/resources/darcula-example.png" alt="Darcula.nvim Preview" />
</p>

## 🎨 Color Palette

| Element | Color | Preview |
|---------|-------|---------|
| Background | `#2B2B2B` | ![#2B2B2B](https://via.placeholder.com/100x30/2B2B2B/2B2B2B.png) |
| Foreground | `#A9B7C6` | ![#A9B7C6](https://via.placeholder.com/100x30/A9B7C6/A9B7C6.png) |
| Keywords | `#CC7832` | ![#CC7832](https://via.placeholder.com/100x30/CC7832/CC7832.png) |
| Strings | `#6A8759` | ![#6A8759](https://via.placeholder.com/100x30/6A8759/6A8759.png) |
| Numbers | `#6897BB` | ![#6897BB](https://via.placeholder.com/100x30/6897BB/6897BB.png) |
| Comments | `#808080` | ![#808080](https://via.placeholder.com/100x30/808080/808080.png) |
| Functions | `#FFC66D` | ![#FFC66D](https://via.placeholder.com/100x30/FFC66D/FFC66D.png) |
| Types | `#769AA5` | ![#769AA5](https://via.placeholder.com/100x30/769AA5/769AA5.png) |
| Constants | `#9876AA` | ![#9876AA](https://via.placeholder.com/100x30/9876AA/9876AA.png) |
| Annotations | `#BBB529` | ![#BBB529](https://via.placeholder.com/100x30/BBB529/BBB529.png) |

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

```lua
{
  "briones-gabriel/darcula-solid.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  priority = 1000,
  config = function()
    vim.cmd("colorscheme darcula")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "briones-gabriel/darcula-solid.nvim",
  requires = "rktjmp/lush.nvim",
  config = function()
    vim.cmd("colorscheme darcula")
  end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'rktjmp/lush.nvim'
Plug 'briones-gabriel/darcula-solid.nvim'
```

Then in your `init.vim`:
```vim
set termguicolors
colorscheme darcula
```

## 🚀 Quick Start

```lua
-- Minimal setup (init.lua)
vim.opt.termguicolors = true
vim.cmd("colorscheme darcula")
```

## 🔌 Supported Plugins

<details>
<summary><b>Expand to see all supported plugins</b></summary>

### Completion
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

### File Explorers
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)

### Fuzzy Finders
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

### Git Integration
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [Neogit](https://github.com/TimUntersberger/neogit)

### UI Enhancements
- [Noice](https://github.com/folke/noice.nvim)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Which-Key](https://github.com/folke/which-key.nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)

### Development Tools
- [Lazy](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)

### Navigation
- [Hop](https://github.com/phaazon/hop.nvim)
- [Leap](https://github.com/ggandor/leap.nvim)

### Other
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)

</details>

## 🛠️ Customization

Darcula.nvim is built with [Lush](https://github.com/rktjmp/lush.nvim), making customization straightforward:

```lua
-- ~/.config/nvim/colors/my-darcula.lua
vim.opt.background = 'dark'
vim.g.colors_name = 'my-darcula'

local lush = require('lush')
local darcula = require('lush_theme.darcula')

local spec = lush.extends({darcula}).with(function()
  return {
    -- Customize any highlight group
    Comment { fg = "#888888", gui = "italic" },
    Function { fg = "#FFD700" },
    -- Add your customizations...
  }
end)

lush(spec)
```

Then apply it:
```lua
vim.cmd("colorscheme my-darcula")
```

## 🌟 Highlights

### Tree-sitter Support
Complete support for modern nvim-treesitter:
- ✅ All `@keyword.*` variants
- ✅ Full `@markup.*` groups for Markdown
- ✅ `@diff.*` groups for version control
- ✅ LSP semantic tokens with modifiers

### JetBrains Conventions
Authentic IDE-like styling:
- **Bold** keywords for visibility
- *Italic* static members, abstract classes, readonly properties
- *Italic* documentation comments
- ~~Strikethrough~~ deprecated items

### Language-Specific Features
- **TypeScript/JavaScript**: Distinct `this` keyword (orange vs purple member variables)
- **Angular**: Custom component highlighting in templates
- **React/TSX/JSX**: Component name highlighting
- **HTML**: Web components and custom elements support

## 🐛 Troubleshooting

Having issues? See the [**Debugging Guide**](DEBUGGING.md) for detailed troubleshooting.

### Quick Fixes

```vim
" Reload everything
:colorscheme darcula
:LspRestart
:write | edit
```

Check what's highlighting an element:
```vim
:Inspect
```

Ensure parsers are installed:
```vim
:TSInstall typescript javascript html tsx jsx
```

## 💡 Tips

- **LSP Semantic Tokens**: Enable for best results (most LSPs enable by default)
- **True Colors**: Ensure your terminal supports 24-bit color
- **Font Ligatures**: Use a font with ligatures (JetBrains Mono, Fira Code, etc.)

## 📚 Requirements

- Neovim ≥ 0.8 (0.9+ recommended)
- `termguicolors` enabled
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (recommended)
- LSP server (recommended)

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest features
- Submit pull requests
- Improve documentation

## 📄 License

MIT License - see [LICENSE](LICENSE) for details

## 🙏 Credits

- **Original Theme**: JetBrains Darcula ([official implementation](https://github.com/bulenkov/Darcula))
- **Framework**: [Lush](https://github.com/rktjmp/lush.nvim) by [@rktjmp](https://github.com/rktjmp)
- **Inspiration**: [@rorystephenson](https://github.com/rorystephenson)

---

<p align="center">
  Made with ❤️ for Neovim
</p>
