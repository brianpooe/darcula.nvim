-- darcula-solid.nvim
-- A high-fidelity port of the JetBrains Darcula theme for Neovim
-- Author: brianpooe
-- License: MIT

local lush = require("lush")
local hsl = lush.hsl

-- The canonical JetBrains Darcula color palette
-- Based on analysis of github.com/bulenkov/Darcula (official implementation)
-- and validated against doums/darcula and rokoroku/vscode-theme-darcula
local p = {
	-- Core Editor Colors (from official sources)
	bg = hsl("#2B2B2B"), -- Editor background
	bg_light = hsl("#3C3F41"), -- UI elements (sidebars, status bars, tool windows)
	bg_gutter = hsl("#313335"), -- Gutter background
	bg_darker = hsl("#242424"), -- Darker background for contrast
	bg_current_line = hsl("#323232"), -- Current line highlight
	
	-- Selection and Search
	bg_visual = hsl("#214283"), -- Selection background (deep desaturated blue)
	bg_search = hsl("#32593D"), -- Primary search result
	bg_search_other = hsl("#4D4D2F"), -- Other search occurrences
	
	-- Text Colors
	fg = hsl("#A9B7C6"), -- Default foreground (parameters, plain text)
	fg_dark = hsl("#606366"), -- Gutter numbers, inactive elements
	fg_comment = hsl("#808080"), -- Comments
	fg_light = hsl("#BBBBBB"), -- Lighter text
	
	-- Syntax Colors (from canonical Darcula)
	keyword = hsl("#CC7832"), -- Keywords (if, for, return), storage classes
	string = hsl("#6A8759"), -- String literals (darker green per JetBrains)
	string_escape = hsl("#CC7832"), -- Escape sequences use keyword color
	number = hsl("#6897BB"), -- Numeric constants
	
	-- Function/Method Colors
	function_call = hsl("#FFC66D"), -- Function and method invocations
	annotation = hsl("#BBB529"), -- Annotations, decorators, attributes
	
	-- Variable/Constant Colors
	constant = hsl("#9876AA"), -- Named constants, enum members
	member_variable = hsl("#9876AA"), -- Instance/class variables (often italicized)
	
	-- Diagnostic Colors (from JetBrains spec)
	error = hsl("#BC3F3C"), -- Error text and underlines
	warning = hsl("#BE9117"), -- Warning text and underlines  
	info = hsl("#525A52"), -- Informational diagnostics
	hint = hsl("#499C54"), -- Success/hint green
	
	-- Diff/VCS Colors
	diff_add = hsl("#4A8F4A"), -- Added lines background
	diff_modified = hsl("#385570"), -- Modified lines background
	diff_delete = hsl("#632F34"), -- Deleted lines background
	
	-- Additional UI Colors
	border = hsl("#616161"), -- UI borders
	border_dark = hsl("#424242"), -- Darker border variant
	gray = hsl("#606060"), -- Various UI elements
	gray_light = hsl("#767676"), -- Lighter gray
	
	-- Special Colors
	white = hsl("#FFFFFF"),
	blue = hsl("#287BDE"), -- Links, special blues
	cyan_bright = hsl("#5394EC"), -- Info, links
	pink = hsl("#CB77B4"), -- Tags, special syntax
}

-- Terminal colors matching JetBrains terminal
vim.g.terminal_color_0 = "#2B2B2B"   -- black
vim.g.terminal_color_1 = "#BC3F3C"   -- red (using error color)
vim.g.terminal_color_2 = "#4A8F4A"   -- green (using diff add)
vim.g.terminal_color_3 = "#BE9117"   -- yellow (using warning)
vim.g.terminal_color_4 = "#6897BB"   -- blue (using number color)
vim.g.terminal_color_5 = "#9876AA"   -- magenta (using constant)
vim.g.terminal_color_6 = "#5394EC"   -- cyan
vim.g.terminal_color_7 = "#A9B7C6"   -- white
vim.g.terminal_color_8 = "#606366"   -- bright black
vim.g.terminal_color_9 = "#FF6B68"   -- bright red
vim.g.terminal_color_10 = "#A8C023"  -- bright green
vim.g.terminal_color_11 = "#FFC66D"  -- bright yellow
vim.g.terminal_color_12 = "#6FB3D2"  -- bright blue
vim.g.terminal_color_13 = "#D197D9"  -- bright magenta
vim.g.terminal_color_14 = "#4DD0E1"  -- bright cyan
vim.g.terminal_color_15 = "#FFFFFF"  -- bright white

---@diagnostic disable: undefined-global
return lush(function()
	return {
		-- == Core Neovim UI Groups == --
		Normal { bg = p.bg, fg = p.fg },
		NormalNC { bg = p.bg, fg = p.fg }, -- Non-current windows
		NormalFloat { bg = p.bg_light, fg = p.fg }, -- Floating windows (LSP hover, etc.)
		FloatBorder { bg = p.bg_light, fg = p.border },
		
		-- Line Numbers and Signs
		SignColumn { bg = p.bg, fg = p.fg_dark },
		LineNr { bg = p.bg_gutter, fg = p.fg_dark },
		CursorLineNr { bg = p.bg_gutter, fg = p.fg, gui = "bold" },
		
		-- Cursor and Current Line
		CursorLine { bg = p.bg_current_line },
		CursorColumn { bg = p.bg_current_line },
		ColorColumn { bg = p.bg_light },
		
		-- Visual Selection
		Visual { bg = p.bg_visual },
		VisualNOS { bg = p.bg_visual },
		
		-- Popup Menu
		Pmenu { bg = p.bg_light, fg = p.fg },
		PmenuSel { bg = p.bg_visual, fg = p.fg },
		PmenuSbar { bg = p.bg_light },
		PmenuThumb { bg = p.fg_dark },
		
		-- Status and Tab Lines
		StatusLine { bg = p.bg_light, fg = p.fg },
		StatusLineNC { bg = p.bg_light, fg = p.fg_dark },
		TabLine { bg = p.bg_gutter, fg = p.fg_dark },
		TabLineFill { bg = p.bg_gutter },
		TabLineSel { bg = p.bg_light, fg = p.fg, gui = "bold" },
		
		-- Window Separators
		VertSplit { fg = p.fg_dark, bg = p.bg },
		WinSeparator { fg = p.fg_dark, bg = p.bg },
		
		-- Search
		Search { bg = p.bg_search },
		IncSearch { bg = p.bg_search_other },
		CurSearch { bg = p.bg_search },
		Substitute { bg = p.warning, fg = p.bg },
		
		-- Messages and UI Elements
		Title { fg = p.keyword, gui = "bold" },
		Directory { fg = p.number },
		ErrorMsg { fg = p.error },
		WarningMsg { fg = p.warning },
		MoreMsg { fg = p.string },
		Question { fg = p.number },
		ModeMsg { fg = p.fg },
		Conceal { fg = p.fg_dark, bg = p.bg },
		Folded { fg = p.fg_comment, bg = p.bg_darker },
		FoldColumn { bg = p.bg_gutter, fg = p.fg_dark },
		
		-- Matching
		MatchParen { bg = p.gray, fg = p.function_call },
		
		-- Special Characters
		NonText { fg = p.fg_dark },
		SpecialKey { fg = p.gray },
		Whitespace { fg = p.gray },
		EndOfBuffer { fg = p.bg },
		
		-- Spell Checking
		SpellBad { sp = p.error, gui = "undercurl" },
		SpellCap { sp = p.warning, gui = "undercurl" },
		SpellLocal { sp = p.info, gui = "undercurl" },
		SpellRare { sp = p.constant, gui = "undercurl" },
		
		-- == Legacy Syntax Groups (Fallback when Tree-sitter is disabled) == --
		Comment { fg = p.fg_comment, gui = "italic" },
		String { fg = p.string },
		Character { fg = p.string },
		Number { fg = p.number },
		Float { fg = p.number },
		Boolean { fg = p.keyword, gui = "italic" },
		
		Keyword { fg = p.keyword, gui = "bold" },
		Conditional { fg = p.keyword, gui = "bold" },
		Repeat { fg = p.keyword, gui = "bold" },
		Statement { fg = p.keyword, gui = "bold" },
		Operator { fg = p.fg },
		Exception { fg = p.keyword, gui = "bold" },
		
		Identifier { fg = p.fg },
		Function { fg = p.function_call },
		
		Type { fg = p.fg },
		StorageClass { fg = p.keyword },
		Structure { fg = p.keyword },
		Typedef { fg = p.keyword },
		
		Constant { fg = p.constant },
		
		PreProc { fg = p.keyword },
		Include { fg = p.keyword },
		Define { fg = p.keyword },
		Macro { fg = p.annotation },
		PreCondit { fg = p.keyword },
		
		Special { fg = p.fg },
		SpecialChar { fg = p.keyword },
		Tag { fg = p.fg },
		Delimiter { fg = p.fg },
		SpecialComment { fg = p.gray_light, gui = "italic" },
		Debug { fg = p.pink },
		
		Todo { fg = p.annotation, bg = p.bg_darker, gui = "bold" },
		Error { fg = p.error },
		Underlined { fg = p.blue, gui = "underline" },
		
		-- == Tree-sitter Highlight Groups == --
		-- Keywords and Control Flow
		["@keyword"] = { fg = p.keyword, gui = "bold" },
		["@keyword.function"] = { fg = p.keyword, gui = "bold" },
		["@keyword.operator"] = { fg = p.keyword, gui = "bold" },
		["@keyword.return"] = { fg = p.keyword, gui = "bold" },
		["@conditional"] = { fg = p.keyword, gui = "bold" },
		["@repeat"] = { fg = p.keyword, gui = "bold" },
		["@exception"] = { fg = p.keyword, gui = "bold" },
		["@include"] = { fg = p.keyword, gui = "bold" },
		
		-- Comments
		["@comment"] = { fg = p.fg_comment, gui = "italic" },
		["@comment.documentation"] = { fg = p.fg_comment, gui = "italic" },
		["@comment.todo"] = { fg = p.annotation, bg = p.bg_darker, gui = "bold" },
		["@comment.warning"] = { fg = p.warning, gui = "bold" },
		["@comment.error"] = { fg = p.error, gui = "bold" },
		
		-- Strings
		["@string"] = { fg = p.string },
		["@string.documentation"] = { fg = p.string, gui = "italic" },
		["@string.regex"] = { fg = p.string },
		["@string.escape"] = { fg = p.keyword }, -- Escape sequences use keyword color
		["@string.special"] = { fg = p.keyword },
		["@character"] = { fg = p.string },
		["@character.special"] = { fg = p.keyword },
		
		-- Numbers and Booleans
		["@number"] = { fg = p.number },
		["@float"] = { fg = p.number },
		["@boolean"] = { fg = p.keyword, gui = "italic" },
		
		-- Functions and Methods
		["@function"] = { fg = p.function_call },
		["@function.call"] = { fg = p.function_call },
		["@function.builtin"] = { fg = p.function_call },
		["@function.macro"] = { fg = p.function_call },
		["@method"] = { fg = p.function_call },
		["@method.call"] = { fg = p.function_call },
		["@constructor"] = { fg = p.function_call },
		
		-- Types
		["@type"] = { fg = p.fg }, -- Darcula uses default foreground for types
		["@type.builtin"] = { fg = p.keyword }, -- Built-in types styled as keywords
		["@type.qualifier"] = { fg = p.keyword },
		["@type.definition"] = { fg = p.fg },
		["@storageclass"] = { fg = p.keyword },
		["@attribute"] = { fg = p.annotation },
		["@field"] = { fg = p.member_variable },
		["@property"] = { fg = p.member_variable },
		
		-- Variables and Parameters
		["@variable"] = { fg = p.fg },
		["@variable.builtin"] = { fg = p.constant, gui = "italic" },
		["@variable.parameter"] = { fg = p.fg },
		["@variable.member"] = { fg = p.member_variable, gui = "italic" },
		
		-- Constants
		["@constant"] = { fg = p.constant },
		["@constant.builtin"] = { fg = p.constant },
		["@constant.macro"] = { fg = p.constant },
		
		-- Punctuation and Operators
		["@punctuation.delimiter"] = { fg = p.fg },
		["@punctuation.bracket"] = { fg = p.fg },
		["@punctuation.special"] = { fg = p.fg },
		["@operator"] = { fg = p.fg },
		
		-- Tags (HTML/XML)
		["@tag"] = { fg = p.fg },
		["@tag.attribute"] = { fg = p.member_variable, gui = "italic" },
		["@tag.delimiter"] = { fg = p.fg },
		
		-- Text/Markup (Markdown)
		["@text"] = { fg = p.fg },
		["@text.strong"] = { gui = "bold" },
		["@text.emphasis"] = { gui = "italic" },
		["@text.underline"] = { gui = "underline" },
		["@text.strike"] = { gui = "strikethrough" },
		["@text.title"] = { fg = p.function_call, gui = "bold" },
		["@text.literal"] = { fg = p.string },
		["@text.uri"] = { fg = p.string, gui = "underline" },
		["@text.reference"] = { fg = p.number },
		
		-- Namespaces and Modules
		["@namespace"] = { fg = p.fg },
		["@module"] = { fg = p.fg },
		["@symbol"] = { fg = p.constant },
		
		-- Labels
		["@label"] = { fg = p.keyword },
		
		-- == LSP Semantic Token Support == --
		["@lsp.type.class"] = { fg = p.fg },
		["@lsp.type.struct"] = { fg = p.fg },
		["@lsp.type.enum"] = { fg = p.fg },
		["@lsp.type.enumMember"] = { fg = p.constant },
		["@lsp.type.interface"] = { fg = p.fg },
		["@lsp.type.typeParameter"] = { fg = p.fg },
		["@lsp.type.namespace"] = { fg = p.fg },
		["@lsp.type.parameter"] = { fg = p.fg },
		["@lsp.type.variable"] = { fg = p.fg },
		["@lsp.type.property"] = { fg = p.member_variable },
		["@lsp.type.function"] = { fg = p.function_call },
		["@lsp.type.method"] = { fg = p.function_call },
		["@lsp.type.macro"] = { fg = p.annotation },
		["@lsp.type.decorator"] = { fg = p.annotation },
		
		["@lsp.mod.deprecated"] = { gui = "strikethrough" },
		["@lsp.mod.readonly"] = { gui = "italic" },
		["@lsp.mod.static"] = { gui = "italic" },
		
		-- == LSP Diagnostics == --
		DiagnosticError { fg = p.error },
		DiagnosticWarn { fg = p.warning },
		DiagnosticInfo { fg = p.info },
		DiagnosticHint { fg = p.hint },
		
		DiagnosticVirtualTextError { fg = p.error, bg = hsl("#3D2929") },
		DiagnosticVirtualTextWarn { fg = p.warning, bg = hsl("#3D3D29") },
		DiagnosticVirtualTextInfo { fg = p.info, bg = hsl("#293D48") },
		DiagnosticVirtualTextHint { fg = p.hint, bg = hsl("#294F33") },
		
		DiagnosticUnderlineError { sp = p.error, gui = "undercurl" },
		DiagnosticUnderlineWarn { sp = p.warning, gui = "undercurl" },
		DiagnosticUnderlineInfo { sp = p.info, gui = "undercurl" },
		DiagnosticUnderlineHint { sp = p.hint, gui = "undercurl" },
		
		DiagnosticFloatingError { fg = p.error, bg = p.bg_light },
		DiagnosticFloatingWarn { fg = p.warning, bg = p.bg_light },
		DiagnosticFloatingInfo { fg = p.info, bg = p.bg_light },
		DiagnosticFloatingHint { fg = p.hint, bg = p.bg_light },
		
		DiagnosticSignError { fg = p.error, bg = p.bg },
		DiagnosticSignWarn { fg = p.warning, bg = p.bg },
		DiagnosticSignInfo { fg = p.info, bg = p.bg },
		DiagnosticSignHint { fg = p.hint, bg = p.bg },
		
		-- LSP References
		LspReferenceText { bg = p.bg_darker },
		LspReferenceRead { bg = p.bg_darker },
		LspReferenceWrite { bg = p.bg_darker, gui = "underline" },
		
		-- LSP Code Lens
		LspCodeLens { fg = p.gray_light },
		LspCodeLensSeparator { fg = p.gray },
		
		-- == Plugin Support == --
		-- NvimTree
		NvimTreeNormal { bg = p.bg, fg = p.fg },
		NvimTreeVertSplit { fg = p.border_dark, bg = p.bg },
		NvimTreeEndOfBuffer { fg = p.bg },
		NvimTreeFolderIcon { fg = p.number },
		NvimTreeFolderName { fg = p.fg },
		NvimTreeOpenedFolderName { fg = p.number, gui = "bold" },
		NvimTreeEmptyFolderName { fg = p.fg_dark },
		NvimTreeRootFolder { fg = p.keyword, gui = "bold" },
		NvimTreeSpecialFile { fg = p.function_call, gui = "underline" },
		NvimTreeGitDirty { fg = p.warning },
		NvimTreeGitStaged { fg = p.hint },
		NvimTreeGitNew { fg = p.hint },
		NvimTreeGitDeleted { fg = p.error },
		
		-- Telescope
		TelescopeNormal { bg = p.bg_light, fg = p.fg },
		TelescopeBorder { fg = p.border, bg = p.bg_light },
		TelescopePromptBorder { fg = p.border, bg = p.bg_light },
		TelescopePromptTitle { fg = p.keyword, bg = p.bg_light, gui = "bold" },
		TelescopePromptPrefix { fg = p.keyword },
		TelescopeSelection { bg = p.bg_visual, fg = p.fg },
		TelescopeSelectionCaret { fg = p.keyword, bg = p.bg_visual },
		TelescopeMatching { fg = p.function_call, gui = "bold" },
		
		-- GitSigns
		GitSignsAdd { fg = p.hint },
		GitSignsAddLn { bg = p.diff_add },
		GitSignsChange { fg = p.warning },
		GitSignsChangeLn { bg = p.diff_modified },
		GitSignsDelete { fg = p.error },
		GitSignsDeleteLn { bg = p.diff_delete },
		GitSignsCurrentLineBlame { fg = p.fg_comment },
		
		-- Diff
		DiffAdd { bg = p.diff_add },
		DiffChange { bg = p.diff_modified },
		DiffDelete { bg = p.diff_delete },
		DiffText { bg = p.warning, fg = p.bg },
		
		-- Neogit
		NeogitBranch { fg = p.constant },
		NeogitRemote { fg = p.number },
		NeogitHunkHeader { bg = p.bg_light, fg = p.fg },
		NeogitHunkHeaderHighlight { bg = p.bg_visual, fg = p.keyword },
		NeogitDiffContextHighlight { bg = p.bg_current_line },
		NeogitDiffDeleteHighlight { bg = p.diff_delete },
		NeogitDiffAddHighlight { bg = p.diff_add },
	}
end)
---@diagnostic enable: undefined-global
