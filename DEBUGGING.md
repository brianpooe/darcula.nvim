# Debugging Darcula Solid Highlighting

If certain elements aren't highlighting correctly, use these debugging techniques:

## 1. Check What Highlight Group Is Applied

Place your cursor on the element that's not highlighting correctly and run:

```vim
:Inspect
```

This will show you the exact highlight groups being applied, from tree-sitter, LSP semantic tokens, and syntax.

## 2. Common Issues

### `this` Keyword Not Highlighting

The `this` keyword should appear in **orange** (#CC7832), not purple like member variables.

**Possible causes:**
- LSP not running or not providing semantic tokens
- Tree-sitter parser not installed for TypeScript/JavaScript
- Theme not reloaded after updates

**Solutions:**
1. Reload the theme: `:colorscheme darcula-solid`
2. Restart LSP: `:LspRestart` (if using nvim-lspconfig) or `:lua vim.lsp.stop_client(vim.lsp.get_clients())`
3. Ensure tree-sitter parsers are installed: `:TSInstall typescript javascript tsx jsx`
4. Check if LSP semantic tokens are enabled (most LSPs enable this by default)

### Angular Components Appearing White/Blue

Custom Angular components (like `<app-header>`, `<my-component>`) should appear in **yellow** (#FFC66D), same as standard HTML tags.

**Possible causes:**
- HTML tree-sitter parser not installed
- Angular Language Server not recognizing custom components
- File type not set to HTML

**Solutions:**
1. Install HTML parser: `:TSInstall html`
2. Reload theme: `:colorscheme darcula-solid`
3. Check file type: `:set filetype?` (should be `html` or `htmlangular`)
4. If using Angular templates, ensure your LSP is configured for Angular

## 3. Verify Tree-sitter Parsers

Run: `:TSInstallInfo`

Ensure these parsers are installed:
- `html` - for HTML templates
- `typescript` - for TypeScript files
- `tsx` - for TypeScript React
- `javascript` - for JavaScript files
- `jsx` - for JavaScript React

## 4. Verify LSP is Running

Run: `:LspInfo`

This shows which LSP servers are attached to the current buffer.

For Angular projects, you should see:
- `angularls` (Angular Language Server) for HTML templates
- `ts_ls` or `tsserver` for TypeScript files

## 5. Check Semantic Token Support

LSP semantic tokens provide rich semantic highlighting. To check if they're working:

```lua
:lua print(vim.inspect(vim.lsp.semantic_tokens.get_at_pos()))
```

## 6. Force Reload Everything

If nothing else works:
1. Reload theme: `:colorscheme darcula-solid`
2. Reload tree-sitter: `:write | edit`
3. Restart LSP: `:LspRestart`
4. Or just restart Neovim

## 7. Report Issues

If you're still having issues, please create a GitHub issue with:
- Output of `:Inspect` on the problematic element
- Output of `:LspInfo`
- Output of `:TSInstallInfo`
- Your Neovim configuration (especially LSP and tree-sitter setup)
