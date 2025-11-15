-- darcula.nvim
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

	-- Type Colors
	type_name = hsl("#769AA5"), -- Classes, interfaces, types (teal-blue)

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
vim.g.terminal_color_0 = "#2B2B2B" -- black
vim.g.terminal_color_1 = "#BC3F3C" -- red (using error color)
vim.g.terminal_color_2 = "#4A8F4A" -- green (using diff add)
vim.g.terminal_color_3 = "#BE9117" -- yellow (using warning)
vim.g.terminal_color_4 = "#6897BB" -- blue (using number color)
vim.g.terminal_color_5 = "#9876AA" -- magenta (using constant)
vim.g.terminal_color_6 = "#5394EC" -- cyan
vim.g.terminal_color_7 = "#A9B7C6" -- white
vim.g.terminal_color_8 = "#606366" -- bright black
vim.g.terminal_color_9 = "#FF6B68" -- bright red
vim.g.terminal_color_10 = "#A8C023" -- bright green
vim.g.terminal_color_11 = "#FFC66D" -- bright yellow
vim.g.terminal_color_12 = "#6FB3D2" -- bright blue
vim.g.terminal_color_13 = "#D197D9" -- bright magenta
vim.g.terminal_color_14 = "#4DD0E1" -- bright cyan
vim.g.terminal_color_15 = "#FFFFFF" -- bright white

---@diagnostic disable: undefined-global
return lush(function()
	return {
		-- == Core Neovim UI Groups == --
		Normal({ bg = p.bg, fg = p.fg }),
		NormalNC({ bg = p.bg, fg = p.fg }), -- Non-current windows
		NormalFloat({ bg = p.bg_light, fg = p.fg }), -- Floating windows (LSP hover, etc.)
		FloatBorder({ bg = p.bg_light, fg = p.border }),

		-- Line Numbers and Signs
		SignColumn({ bg = p.bg, fg = p.fg_dark }),
		LineNr({ bg = p.bg_gutter, fg = p.fg_dark }),
		CursorLineNr({ bg = p.bg_gutter, fg = p.fg, gui = "bold" }),

		-- Cursor and Current Line
		CursorLine({ bg = p.bg_current_line }),
		CursorColumn({ bg = p.bg_current_line }),
		ColorColumn({ bg = p.bg_light }),

		-- Visual Selection
		Visual({ bg = p.bg_visual }),
		VisualNOS({ bg = p.bg_visual }),

		-- Popup Menu
		Pmenu({ bg = p.bg_light, fg = p.fg }),
		PmenuSel({ bg = p.bg_visual, fg = p.fg }),
		PmenuSbar({ bg = p.bg_light }),
		PmenuThumb({ bg = p.fg_dark }),

		-- Status and Tab Lines
		StatusLine({ bg = p.bg_light, fg = p.fg }),
		StatusLineNC({ bg = p.bg_light, fg = p.fg_dark }),
		TabLine({ bg = p.bg_gutter, fg = p.fg_dark }),
		TabLineFill({ bg = p.bg_gutter }),
		TabLineSel({ bg = p.bg_light, fg = p.fg, gui = "bold" }),

		-- Window Separators
		VertSplit({ fg = p.fg_dark, bg = p.bg }),
		WinSeparator({ fg = p.fg_dark, bg = p.bg }),

		-- Search
		Search({ bg = p.bg_search }),
		IncSearch({ bg = p.bg_search_other }),
		CurSearch({ bg = p.bg_search }),
		Substitute({ bg = p.warning, fg = p.bg }),

		-- Messages and UI Elements
		Title({ fg = p.keyword, gui = "bold" }),
		Directory({ fg = p.number }),
		ErrorMsg({ fg = p.error }),
		WarningMsg({ fg = p.warning }),
		MoreMsg({ fg = p.string }),
		Question({ fg = p.number }),
		ModeMsg({ fg = p.fg }),
		Conceal({ fg = p.fg_dark, bg = p.bg }),
		Folded({ fg = p.fg_comment, bg = p.bg_darker }),
		FoldColumn({ bg = p.bg_gutter, fg = p.fg_dark }),

		-- Matching
		MatchParen({ bg = p.gray, fg = p.function_call }),

		-- Special Characters
		NonText({ fg = p.fg_dark }),
		SpecialKey({ fg = p.gray }),
		Whitespace({ fg = p.gray }),
		EndOfBuffer({ fg = p.bg }),

		-- Spell Checking
		SpellBad({ sp = p.error, gui = "undercurl" }),
		SpellCap({ sp = p.warning, gui = "undercurl" }),
		SpellLocal({ sp = p.info, gui = "undercurl" }),
		SpellRare({ sp = p.constant, gui = "undercurl" }),

		-- == Legacy Syntax Groups (Fallback when Tree-sitter is disabled) == --
		Comment({ fg = p.fg_comment, gui = "italic" }),
		String({ fg = p.string }),
		Character({ fg = p.string }),
		Number({ fg = p.number }),
		Float({ fg = p.number }),
		Boolean({ fg = p.keyword, gui = "italic" }),

		Keyword({ fg = p.keyword, gui = "bold" }),
		Conditional({ fg = p.keyword, gui = "bold" }),
		Repeat({ fg = p.keyword, gui = "bold" }),
		Statement({ fg = p.keyword, gui = "bold" }),
		Operator({ fg = p.fg }),
		Exception({ fg = p.keyword, gui = "bold" }),

		Identifier({ fg = p.fg }),
		Function({ fg = p.function_call }),

		Type({ fg = p.type_name }),
		StorageClass({ fg = p.keyword }),
		Structure({ fg = p.keyword }),
		Typedef({ fg = p.keyword }),

		Constant({ fg = p.constant }),

		PreProc({ fg = p.keyword }),
		Include({ fg = p.keyword }),
		Define({ fg = p.keyword }),
		Macro({ fg = p.annotation }),
		PreCondit({ fg = p.keyword }),

		Special({ fg = p.fg }),
		SpecialChar({ fg = p.keyword }),
		Tag({ fg = p.function_call }), -- HTML tags in legacy syntax
		Delimiter({ fg = p.fg }),
		SpecialComment({ fg = p.gray_light, gui = "italic" }),
		Debug({ fg = p.pink }),

		-- HTML Legacy Groups
		htmlTag({ fg = p.fg }),
		htmlEndTag({ fg = p.fg }),
		htmlTagName({ fg = p.function_call }),
		htmlArg({ fg = p.member_variable, gui = "italic" }),
		htmlSpecialChar({ fg = p.keyword }),
		htmlString({ fg = p.string }),
		htmlComment({ fg = p.fg_comment, gui = "italic" }),
		htmlCommentPart({ fg = p.fg_comment, gui = "italic" }),
		htmlSpecialTagName({ fg = p.function_call }),
		htmlLink({ fg = p.string, gui = "underline" }),
		htmlBold({ gui = "bold" }),
		htmlItalic({ gui = "italic" }),
		htmlH1({ fg = p.function_call, gui = "bold" }),
		htmlH2({ fg = p.function_call, gui = "bold" }),
		htmlH3({ fg = p.function_call, gui = "bold" }),
		htmlH4({ fg = p.function_call, gui = "bold" }),
		htmlH5({ fg = p.function_call, gui = "bold" }),
		htmlH6({ fg = p.function_call, gui = "bold" }),

		Todo({ fg = p.annotation, bg = p.bg_darker, gui = "bold" }),
		Error({ fg = p.error }),
		Underlined({ fg = p.blue, gui = "underline" }),

		-- == Tree-sitter Highlight Groups == --
		-- Keywords and Control Flow
		["@keyword"] = { fg = p.keyword, gui = "bold" },
		["@keyword.coroutine"] = { fg = p.keyword, gui = "bold" },
		["@keyword.function"] = { fg = p.keyword, gui = "bold" },
		["@keyword.operator"] = { fg = p.keyword, gui = "bold" },
		["@keyword.return"] = { fg = p.keyword, gui = "bold" },
		["@keyword.import"] = { fg = p.keyword, gui = "bold" },
		["@keyword.type"] = { fg = p.keyword, gui = "bold" },
		["@keyword.modifier"] = { fg = p.keyword, gui = "bold" },
		["@keyword.repeat"] = { fg = p.keyword, gui = "bold" },
		["@keyword.debug"] = { fg = p.keyword, gui = "bold" },
		["@keyword.exception"] = { fg = p.keyword, gui = "bold" },
		["@keyword.conditional"] = { fg = p.keyword, gui = "bold" },
		["@keyword.conditional.ternary"] = { fg = p.keyword, gui = "bold" },
		["@keyword.directive"] = { fg = p.keyword, gui = "bold" },
		["@keyword.directive.define"] = { fg = p.keyword, gui = "bold" },

		-- Legacy aliases (for backward compatibility)
		["@conditional"] = { fg = p.keyword, gui = "bold" },
		["@repeat"] = { fg = p.keyword, gui = "bold" },
		["@exception"] = { fg = p.keyword, gui = "bold" },
		["@include"] = { fg = p.keyword, gui = "bold" },

		-- Comments
		["@comment"] = { fg = p.fg_comment, gui = "italic" },
		["@comment.documentation"] = { fg = p.fg_comment, gui = "italic" },
		["@comment.error"] = { fg = p.error, gui = "bold" },
		["@comment.warning"] = { fg = p.warning, gui = "bold" },
		["@comment.todo"] = { fg = p.annotation, bg = p.bg_darker, gui = "bold" },
		["@comment.note"] = { fg = p.hint, gui = "bold" },

		-- Strings
		["@string"] = { fg = p.string },
		["@string.documentation"] = { fg = p.string, gui = "italic" },
		["@string.regexp"] = { fg = p.string },
		["@string.escape"] = { fg = p.keyword }, -- Escape sequences use keyword color
		["@string.special"] = { fg = p.keyword },
		["@string.special.symbol"] = { fg = p.constant }, -- Symbols in Ruby, Lisp, etc.
		["@string.special.url"] = { fg = p.blue, gui = "underline" },
		["@string.special.path"] = { fg = p.string },
		["@character"] = { fg = p.string },
		["@character.special"] = { fg = p.keyword },

		-- Legacy alias (for backward compatibility)
		["@string.regex"] = { fg = p.string },

		-- Numbers and Booleans
		["@number"] = { fg = p.number },
		["@number.float"] = { fg = p.number },
		["@boolean"] = { fg = p.keyword, gui = "italic" },

		-- Legacy alias (for backward compatibility)
		["@float"] = { fg = p.number },

		-- Functions and Methods
		["@function"] = { fg = p.function_call },
		["@function.call"] = { fg = p.function_call },
		["@function.builtin"] = { fg = p.function_call },
		["@function.macro"] = { fg = p.function_call },
		["@function.method"] = { fg = p.function_call },
		["@function.method.call"] = { fg = p.function_call },
		["@constructor"] = { fg = p.function_call },

		-- Legacy aliases (for backward compatibility)
		["@method"] = { fg = p.function_call },
		["@method.call"] = { fg = p.function_call },

		-- Types
		["@type"] = { fg = p.type_name }, -- Darcula uses teal-blue for types
		["@type.builtin"] = { fg = p.keyword }, -- Built-in types styled as keywords
		["@type.qualifier"] = { fg = p.keyword },
		["@type.definition"] = { fg = p.type_name },
		["@attribute"] = { fg = p.annotation },
		["@attribute.builtin"] = { fg = p.annotation },
		["@property"] = { fg = p.member_variable },

		-- Legacy aliases (for backward compatibility)
		["@storageclass"] = { fg = p.keyword },
		["@field"] = { fg = p.member_variable },

		-- Variables and Parameters
		["@variable"] = { fg = p.fg },
		["@variable.builtin"] = { fg = p.constant, gui = "italic" },
		["@variable.parameter"] = { fg = p.fg },
		["@variable.parameter.builtin"] = { fg = p.constant, gui = "italic" },
		["@variable.member"] = { fg = p.member_variable, gui = "italic" },

		-- Special handling for 'this' keyword (should be distinct from member variables)
		-- Multiple approaches to catch 'this' keyword in different contexts
		["@variable.builtin.this"] = { fg = p.keyword, gui = "italic" },
		["@keyword.this"] = { fg = p.keyword, gui = "italic" },
		["@variable.language"] = { fg = p.keyword, gui = "italic" }, -- Used by some parsers for 'this'
		["@variable.language.this"] = { fg = p.keyword, gui = "italic" },

		-- Constants
		["@constant"] = { fg = p.constant },
		["@constant.builtin"] = { fg = p.constant },
		["@constant.macro"] = { fg = p.constant },

		-- Punctuation and Operators
		["@punctuation.delimiter"] = { fg = p.fg },
		["@punctuation.bracket"] = { fg = p.fg },
		["@punctuation.special"] = { fg = p.keyword }, -- String interpolation, special symbols
		["@operator"] = { fg = p.fg },

		-- Tags (HTML/XML/JSX/TSX)
		["@tag"] = { fg = p.function_call }, -- Tag names should be yellow in Darcula
		["@tag.builtin"] = { fg = p.function_call }, -- HTML5 tags
		["@tag.attribute"] = { fg = p.member_variable, gui = "italic" },
		["@tag.delimiter"] = { fg = p.fg },

		-- HTML specific
		["@text.html"] = { fg = p.fg },
		["@tag.html"] = { fg = p.function_call },
		["@tag.attribute.html"] = { fg = p.member_variable, gui = "italic" },
		["@tag.delimiter.html"] = { fg = p.fg },
		["@constant.html"] = { fg = p.string }, -- attribute values
		["@string.html"] = { fg = p.string },

		-- XML specific
		["@tag.xml"] = { fg = p.function_call },
		["@tag.attribute.xml"] = { fg = p.member_variable, gui = "italic" },
		["@tag.delimiter.xml"] = { fg = p.fg },
		["@string.xml"] = { fg = p.string },

		-- JSX/TSX specific
		["@tag.tsx"] = { fg = p.function_call },
		["@tag.jsx"] = { fg = p.function_call },
		["@tag.attribute.tsx"] = { fg = p.member_variable, gui = "italic" },
		["@tag.attribute.jsx"] = { fg = p.member_variable, gui = "italic" },
		["@constructor.tsx"] = { fg = p.function_call }, -- Component names
		["@constructor.jsx"] = { fg = p.function_call },

		-- Angular specific (custom components in templates)
		-- Angular components can be captured in multiple ways depending on parser
		["@constructor.html"] = { fg = p.function_call }, -- Angular components in HTML
		["@type.html"] = { fg = p.function_call }, -- Angular components that appear as types
		["@tag.component"] = { fg = p.function_call }, -- Web components / custom elements
		["@tag.custom"] = { fg = p.function_call }, -- Custom tags

		-- Markup (Markdown, reStructuredText, etc.) - New standard
		["@markup.strong"] = { gui = "bold" },
		["@markup.italic"] = { gui = "italic" },
		["@markup.strikethrough"] = { gui = "strikethrough" },
		["@markup.underline"] = { gui = "underline" },

		["@markup.heading"] = { fg = p.function_call, gui = "bold" },
		["@markup.heading.1"] = { fg = p.function_call, gui = "bold" },
		["@markup.heading.2"] = { fg = p.function_call, gui = "bold" },
		["@markup.heading.3"] = { fg = p.function_call, gui = "bold" },
		["@markup.heading.4"] = { fg = p.function_call, gui = "bold" },
		["@markup.heading.5"] = { fg = p.function_call, gui = "bold" },
		["@markup.heading.6"] = { fg = p.function_call, gui = "bold" },

		["@markup.quote"] = { fg = p.fg_comment, gui = "italic" },
		["@markup.math"] = { fg = p.number },

		["@markup.link"] = { fg = p.blue, gui = "underline" },
		["@markup.link.label"] = { fg = p.number },
		["@markup.link.url"] = { fg = p.string, gui = "underline" },

		["@markup.raw"] = { fg = p.string },
		["@markup.raw.block"] = { fg = p.string },

		["@markup.list"] = { fg = p.keyword },
		["@markup.list.checked"] = { fg = p.hint },
		["@markup.list.unchecked"] = { fg = p.fg_dark },

		-- Legacy @text.* groups (for backward compatibility)
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
		["@module"] = { fg = p.type_name },
		["@module.builtin"] = { fg = p.type_name },

		-- Legacy aliases (for backward compatibility)
		["@namespace"] = { fg = p.type_name },
		["@symbol"] = { fg = p.constant },

		-- Labels
		["@label"] = { fg = p.keyword },

		-- Diff (Version Control)
		["@diff.plus"] = { fg = p.hint, bg = p.diff_add },
		["@diff.minus"] = { fg = p.error, bg = p.diff_delete },
		["@diff.delta"] = { fg = p.warning, bg = p.diff_modified },

		-- Special Captures
		["@none"] = { fg = "NONE", bg = "NONE" }, -- Disable highlighting
		["@conceal"] = { fg = p.fg_dark }, -- Concealed text
		["@spell"] = {}, -- Enable spell checking
		["@nospell"] = {}, -- Disable spell checking

		-- == LSP Semantic Token Support == --
		["@lsp.type.class"] = { fg = p.type_name },
		["@lsp.type.struct"] = { fg = p.type_name },
		["@lsp.type.enum"] = { fg = p.type_name },
		["@lsp.type.enumMember"] = { fg = p.constant },
		["@lsp.type.interface"] = { fg = p.type_name },
		["@lsp.type.typeParameter"] = { fg = p.type_name },
		["@lsp.type.namespace"] = { fg = p.type_name },
		["@lsp.type.parameter"] = { fg = p.fg },
		["@lsp.type.variable"] = { fg = p.fg },
		["@lsp.type.property"] = { fg = p.member_variable },
		["@lsp.type.function"] = { fg = p.function_call },
		["@lsp.type.method"] = { fg = p.function_call },
		["@lsp.type.macro"] = { fg = p.annotation },
		["@lsp.type.decorator"] = { fg = p.annotation },
		-- 'this' keyword handling (multiple semantic token types)
		-- NOTE: For changes to take effect, reload with :colorscheme darcula
		-- or restart Neovim and ensure LSP is reloaded
		["@lsp.type.selfKeyword"] = { fg = p.keyword, gui = "italic" }, -- 'this' in TypeScript/JavaScript
		["@lsp.type.selfParameter"] = { fg = p.keyword, gui = "italic" }, -- 'this' as parameter

		-- Angular/React component handling
		["@lsp.type.component"] = { fg = p.function_call }, -- Angular/React components
		["@lsp.type.customElement"] = { fg = p.function_call }, -- Web components

		["@lsp.mod.deprecated"] = { gui = "strikethrough" },
		["@lsp.mod.readonly"] = { gui = "italic" },
		["@lsp.mod.static"] = { gui = "italic" },
		["@lsp.mod.abstract"] = { gui = "italic" },
		["@lsp.mod.async"] = {},
		["@lsp.mod.declaration"] = {},
		["@lsp.mod.defaultLibrary"] = { gui = "italic" },
		["@lsp.mod.definition"] = {},
		["@lsp.mod.modification"] = {},
		["@lsp.mod.documentation"] = {},

		-- == LSP Diagnostics == --
		DiagnosticError({ fg = p.error }),
		DiagnosticWarn({ fg = p.warning }),
		DiagnosticInfo({ fg = p.info }),
		DiagnosticHint({ fg = p.hint }),

		DiagnosticVirtualTextError({ fg = p.error, bg = hsl("#3D2929") }),
		DiagnosticVirtualTextWarn({ fg = p.warning, bg = hsl("#3D3D29") }),
		DiagnosticVirtualTextInfo({ fg = p.info, bg = hsl("#293D48") }),
		DiagnosticVirtualTextHint({ fg = p.hint, bg = hsl("#294F33") }),

		DiagnosticUnderlineError({ sp = p.error, gui = "undercurl" }),
		DiagnosticUnderlineWarn({ sp = p.warning, gui = "undercurl" }),
		DiagnosticUnderlineInfo({ sp = p.info, gui = "undercurl" }),
		DiagnosticUnderlineHint({ sp = p.hint, gui = "undercurl" }),

		DiagnosticFloatingError({ fg = p.error, bg = p.bg_light }),
		DiagnosticFloatingWarn({ fg = p.warning, bg = p.bg_light }),
		DiagnosticFloatingInfo({ fg = p.info, bg = p.bg_light }),
		DiagnosticFloatingHint({ fg = p.hint, bg = p.bg_light }),

		DiagnosticSignError({ fg = p.error, bg = p.bg }),
		DiagnosticSignWarn({ fg = p.warning, bg = p.bg }),
		DiagnosticSignInfo({ fg = p.info, bg = p.bg }),
		DiagnosticSignHint({ fg = p.hint, bg = p.bg }),

		-- LSP References
		LspReferenceText({ bg = p.bg_darker }),
		LspReferenceRead({ bg = p.bg_darker }),
		LspReferenceWrite({ bg = p.bg_darker, gui = "underline" }),

		-- LSP Code Lens
		LspCodeLens({ fg = p.gray_light }),
		LspCodeLensSeparator({ fg = p.gray }),

		-- == Plugin Support == --
		-- NvimTree (Enhanced File Explorer)
		NvimTreeNormal({ bg = p.bg, fg = p.fg }),
		NvimTreeNormalNC({ bg = p.bg, fg = p.fg }),
		NvimTreeVertSplit({ fg = p.border_dark, bg = p.bg }),
		NvimTreeWinSeparator({ fg = p.border_dark, bg = p.bg }),
		NvimTreeEndOfBuffer({ fg = p.bg }),
		NvimTreeCursorLine({ bg = p.bg_current_line }),
		NvimTreeCursorColumn({ bg = p.bg_current_line }),
		NvimTreeStatusLine({ bg = p.bg_light, fg = p.fg }),
		NvimTreeStatusLineNC({ bg = p.bg_light, fg = p.fg_dark }),

		-- Folders
		NvimTreeFolderIcon({ fg = p.number }),
		NvimTreeFolderName({ fg = p.fg }),
		NvimTreeOpenedFolderName({ fg = p.number, gui = "bold" }),
		NvimTreeEmptyFolderName({ fg = p.fg_dark }),
		NvimTreeSymlinkFolderName({ fg = p.blue, gui = "italic" }),

		-- Files
		NvimTreeRootFolder({ fg = p.keyword, gui = "bold" }),
		NvimTreeExecFile({ fg = p.hint, gui = "bold" }),
		NvimTreeSpecialFile({ fg = p.function_call, gui = "underline" }),
		NvimTreeImageFile({ fg = p.constant }),
		NvimTreeSymlink({ fg = p.blue, gui = "italic" }),
		NvimTreeModifiedFile({ fg = p.warning }),
		NvimTreeOpenedFile({ fg = p.number, gui = "bold" }),
		NvimTreeHiddenFile({ fg = p.fg_dark }),

		-- Git Status
		NvimTreeGitDirty({ fg = p.warning }),
		NvimTreeGitStaged({ fg = p.hint }),
		NvimTreeGitNew({ fg = p.hint }),
		NvimTreeGitRenamed({ fg = p.number }),
		NvimTreeGitDeleted({ fg = p.error }),
		NvimTreeGitMerge({ fg = p.constant }),
		NvimTreeGitIgnored({ fg = p.fg_dark }),

		-- File Highlights (decorations)
		NvimTreeFileDirty({ fg = p.warning }),
		NvimTreeFileStaged({ fg = p.hint }),
		NvimTreeFileNew({ fg = p.hint }),
		NvimTreeFileRenamed({ fg = p.number }),
		NvimTreeFileDeleted({ fg = p.error }),
		NvimTreeFileMerge({ fg = p.constant }),
		NvimTreeFileIgnored({ fg = p.fg_dark }),

		-- Folder Highlights (decorations)
		NvimTreeFolderDirty({ fg = p.warning }),
		NvimTreeFolderStaged({ fg = p.hint }),
		NvimTreeFolderNew({ fg = p.hint }),
		NvimTreeFolderRenamed({ fg = p.number }),
		NvimTreeFolderDeleted({ fg = p.error }),
		NvimTreeFolderMerge({ fg = p.constant }),
		NvimTreeFolderIgnored({ fg = p.fg_dark }),

		-- Clipboard
		NvimTreeCutHL({ fg = p.error, gui = "bold" }),
		NvimTreeCopiedHL({ fg = p.hint, gui = "bold" }),

		-- Bookmarks
		NvimTreeBookmarkHL({ fg = p.constant, gui = "bold" }),

		-- Diagnostics
		NvimTreeLspDiagnosticsError({ fg = p.error }),
		NvimTreeLspDiagnosticsWarning({ fg = p.warning }),
		NvimTreeLspDiagnosticsInformation({ fg = p.info }),
		NvimTreeLspDiagnosticsHint({ fg = p.hint }),

		-- Window Picker
		NvimTreeWindowPicker({ bg = p.bg_visual, fg = p.function_call, gui = "bold" }),

		-- Indent Markers
		NvimTreeIndentMarker({ fg = p.bg_darker }),
		NvimTreeLiveFilterPrefix({ fg = p.keyword, gui = "bold" }),
		NvimTreeLiveFilterValue({ fg = p.function_call, gui = "bold" }),

		-- Telescope
		TelescopeNormal({ bg = p.bg_light, fg = p.fg }),
		TelescopeBorder({ fg = p.border, bg = p.bg_light }),
		TelescopePromptBorder({ fg = p.border, bg = p.bg_light }),
		TelescopeResultsBorder({ fg = p.border, bg = p.bg_light }),
		TelescopePreviewBorder({ fg = p.border, bg = p.bg_light }),
		TelescopePromptTitle({ fg = p.keyword, bg = p.bg_light, gui = "bold" }),
		TelescopeResultsTitle({ fg = p.function_call, bg = p.bg_light, gui = "bold" }),
		TelescopePreviewTitle({ fg = p.number, bg = p.bg_light, gui = "bold" }),
		TelescopePromptPrefix({ fg = p.keyword }),
		TelescopePromptCounter({ fg = p.fg_dark }),
		TelescopeSelection({ bg = p.bg_visual, fg = p.fg }),
		TelescopeSelectionCaret({ fg = p.keyword, bg = p.bg_visual }),
		TelescopeMultiSelection({ bg = p.bg_darker, fg = p.fg }),
		TelescopeMultiIcon({ fg = p.keyword }),
		TelescopeMatching({ fg = p.function_call, gui = "bold" }),
		TelescopePreviewLine({ bg = p.bg_visual }),
		TelescopePreviewMatch({ fg = p.function_call, gui = "bold" }),

		-- GitSigns
		GitSignsAdd({ fg = p.hint }),
		GitSignsAddLn({ bg = p.diff_add }),
		GitSignsChange({ fg = p.warning }),
		GitSignsChangeLn({ bg = p.diff_modified }),
		GitSignsDelete({ fg = p.error }),
		GitSignsDeleteLn({ bg = p.diff_delete }),
		GitSignsCurrentLineBlame({ fg = p.fg_comment }),

		-- Blink.cmp (Completion Menu)
		BlinkCmpMenu({ bg = p.bg_light, fg = p.fg }),
		BlinkCmpMenuBorder({ fg = p.border, bg = p.bg_light }),
		BlinkCmpMenuSelection({ bg = p.bg_visual, fg = p.fg }),
		BlinkCmpLabel({ fg = p.fg }),
		BlinkCmpLabelDeprecated({ fg = p.fg_dark, gui = "strikethrough" }),
		BlinkCmpLabelMatch({ fg = p.function_call, gui = "bold" }),
		BlinkCmpLabelDetail({ fg = p.fg_comment }),
		BlinkCmpLabelDescription({ fg = p.fg_comment }),
		BlinkCmpKind({ fg = p.type_name }),
		BlinkCmpKindText({ fg = p.fg }),
		BlinkCmpKindMethod({ fg = p.function_call }),
		BlinkCmpKindFunction({ fg = p.function_call }),
		BlinkCmpKindConstructor({ fg = p.function_call }),
		BlinkCmpKindField({ fg = p.member_variable }),
		BlinkCmpKindVariable({ fg = p.fg }),
		BlinkCmpKindClass({ fg = p.type_name }),
		BlinkCmpKindInterface({ fg = p.type_name }),
		BlinkCmpKindModule({ fg = p.type_name }),
		BlinkCmpKindProperty({ fg = p.member_variable }),
		BlinkCmpKindUnit({ fg = p.number }),
		BlinkCmpKindValue({ fg = p.constant }),
		BlinkCmpKindEnum({ fg = p.type_name }),
		BlinkCmpKindKeyword({ fg = p.keyword }),
		BlinkCmpKindSnippet({ fg = p.string }),
		BlinkCmpKindColor({ fg = p.number }),
		BlinkCmpKindFile({ fg = p.fg }),
		BlinkCmpKindReference({ fg = p.number }),
		BlinkCmpKindFolder({ fg = p.number }),
		BlinkCmpKindEnumMember({ fg = p.constant }),
		BlinkCmpKindConstant({ fg = p.constant }),
		BlinkCmpKindStruct({ fg = p.type_name }),
		BlinkCmpKindEvent({ fg = p.keyword }),
		BlinkCmpKindOperator({ fg = p.fg }),
		BlinkCmpKindTypeParameter({ fg = p.type_name }),
		BlinkCmpDoc({ bg = p.bg_light, fg = p.fg }),
		BlinkCmpDocBorder({ fg = p.border, bg = p.bg_light }),
		BlinkCmpDocCursorLine({ bg = p.bg_current_line }),
		BlinkCmpSignatureHelp({ bg = p.bg_light, fg = p.fg }),
		BlinkCmpSignatureHelpBorder({ fg = p.border, bg = p.bg_light }),
		BlinkCmpSignatureHelpActiveParameter({ fg = p.function_call, gui = "bold" }),

		-- nvim-cmp (Alternative Completion)
		CmpItemAbbr({ fg = p.fg }),
		CmpItemAbbrDeprecated({ fg = p.fg_dark, gui = "strikethrough" }),
		CmpItemAbbrMatch({ fg = p.function_call, gui = "bold" }),
		CmpItemAbbrMatchFuzzy({ fg = p.function_call }),
		CmpItemKind({ fg = p.type_name }),
		CmpItemKindText({ fg = p.fg }),
		CmpItemKindMethod({ fg = p.function_call }),
		CmpItemKindFunction({ fg = p.function_call }),
		CmpItemKindConstructor({ fg = p.function_call }),
		CmpItemKindField({ fg = p.member_variable }),
		CmpItemKindVariable({ fg = p.fg }),
		CmpItemKindClass({ fg = p.type_name }),
		CmpItemKindInterface({ fg = p.type_name }),
		CmpItemKindModule({ fg = p.type_name }),
		CmpItemKindProperty({ fg = p.member_variable }),
		CmpItemKindUnit({ fg = p.number }),
		CmpItemKindValue({ fg = p.constant }),
		CmpItemKindEnum({ fg = p.type_name }),
		CmpItemKindKeyword({ fg = p.keyword }),
		CmpItemKindSnippet({ fg = p.string }),
		CmpItemKindColor({ fg = p.number }),
		CmpItemKindFile({ fg = p.fg }),
		CmpItemKindReference({ fg = p.number }),
		CmpItemKindFolder({ fg = p.number }),
		CmpItemKindEnumMember({ fg = p.constant }),
		CmpItemKindConstant({ fg = p.constant }),
		CmpItemKindStruct({ fg = p.type_name }),
		CmpItemKindEvent({ fg = p.keyword }),
		CmpItemKindOperator({ fg = p.fg }),
		CmpItemKindTypeParameter({ fg = p.type_name }),
		CmpItemMenu({ fg = p.fg_comment }),

		-- Bufferline
		BufferLineFill({ bg = p.bg_gutter }),
		BufferLineBackground({ bg = p.bg_gutter, fg = p.fg_dark }),
		BufferLineBufferVisible({ bg = p.bg_gutter, fg = p.fg }),
		BufferLineBufferSelected({ bg = p.bg, fg = p.fg, gui = "bold" }),
		BufferLineTab({ bg = p.bg_gutter, fg = p.fg_dark }),
		BufferLineTabSelected({ bg = p.bg, fg = p.keyword, gui = "bold" }),
		BufferLineTabSeparator({ fg = p.bg_gutter, bg = p.bg_gutter }),
		BufferLineTabSeparatorSelected({ fg = p.bg, bg = p.bg }),
		BufferLineIndicatorSelected({ fg = p.keyword, bg = p.bg }),
		BufferLineCloseButton({ bg = p.bg_gutter, fg = p.fg_dark }),
		BufferLineCloseButtonVisible({ bg = p.bg_gutter, fg = p.fg }),
		BufferLineCloseButtonSelected({ bg = p.bg, fg = p.error }),
		BufferLineModified({ bg = p.bg_gutter, fg = p.warning }),
		BufferLineModifiedVisible({ bg = p.bg_gutter, fg = p.warning }),
		BufferLineModifiedSelected({ bg = p.bg, fg = p.warning }),
		BufferLineDuplicate({ bg = p.bg_gutter, fg = p.fg_dark, gui = "italic" }),
		BufferLineDuplicateVisible({ bg = p.bg_gutter, fg = p.fg, gui = "italic" }),
		BufferLineDuplicateSelected({ bg = p.bg, fg = p.fg, gui = "bold,italic" }),
		BufferLineSeparator({ fg = p.bg_gutter, bg = p.bg_gutter }),
		BufferLineSeparatorVisible({ fg = p.bg_gutter, bg = p.bg_gutter }),
		BufferLineSeparatorSelected({ fg = p.bg, bg = p.bg }),
		BufferLineError({ bg = p.bg_gutter, fg = p.error }),
		BufferLineErrorDiagnostic({ bg = p.bg_gutter, fg = p.error }),
		BufferLineWarning({ bg = p.bg_gutter, fg = p.warning }),
		BufferLineWarningDiagnostic({ bg = p.bg_gutter, fg = p.warning }),
		BufferLineInfo({ bg = p.bg_gutter, fg = p.info }),
		BufferLineInfoDiagnostic({ bg = p.bg_gutter, fg = p.info }),
		BufferLineHint({ bg = p.bg_gutter, fg = p.hint }),
		BufferLineHintDiagnostic({ bg = p.bg_gutter, fg = p.hint }),

		-- Noice (Command Line UI)
		NoicePopup({ bg = p.bg_light, fg = p.fg }),
		NoicePopupBorder({ fg = p.border, bg = p.bg_light }),
		NoiceCmdline({ bg = p.bg_light, fg = p.fg }),
		NoiceCmdlinePopup({ bg = p.bg_light, fg = p.fg }),
		NoiceCmdlinePopupBorder({ fg = p.border, bg = p.bg_light }),
		NoiceCmdlinePopupTitle({ fg = p.keyword, bg = p.bg_light, gui = "bold" }),
		NoiceCmdlineIcon({ fg = p.keyword }),
		NoiceCmdlineIconSearch({ fg = p.function_call }),
		NoiceConfirm({ bg = p.bg_light, fg = p.fg }),
		NoiceConfirmBorder({ fg = p.border, bg = p.bg_light }),
		NoiceSplit({ bg = p.bg_light, fg = p.fg }),
		NoiceSplitBorder({ fg = p.border, bg = p.bg_light }),

		-- Lazy (Plugin Manager)
		LazyNormal({ bg = p.bg_light, fg = p.fg }),
		LazyButton({ bg = p.bg_darker, fg = p.fg }),
		LazyButtonActive({ bg = p.bg_visual, fg = p.fg, gui = "bold" }),
		LazyH1({ fg = p.keyword, gui = "bold" }),
		LazyH2({ fg = p.function_call }),
		LazyComment({ fg = p.fg_comment, gui = "italic" }),
		LazyCommit({ fg = p.number }),
		LazyCommitType({ fg = p.keyword }),
		LazyDimmed({ fg = p.fg_dark }),
		LazyProp({ fg = p.member_variable }),
		LazyValue({ fg = p.string }),
		LazyDir({ fg = p.number }),
		LazyUrl({ fg = p.blue, gui = "underline" }),
		LazySpecial({ fg = p.function_call }),
		LazyReasonPlugin({ fg = p.keyword }),
		LazyReasonRuntime({ fg = p.type_name }),
		LazyReasonCmd({ fg = p.function_call }),
		LazyReasonSource({ fg = p.number }),
		LazyReasonFt({ fg = p.string }),
		LazyReasonKeys({ fg = p.constant }),
		LazyReasonEvent({ fg = p.warning }),
		LazyReasonStart({ fg = p.hint }),
		LazyProgressDone({ fg = p.hint, gui = "bold" }),
		LazyProgressTodo({ fg = p.fg_dark }),

		-- Which-Key
		WhichKey({ fg = p.keyword, gui = "bold" }),
		WhichKeyGroup({ fg = p.function_call }),
		WhichKeyDesc({ fg = p.fg }),
		WhichKeySeparator({ fg = p.fg_dark }),
		WhichKeyFloat({ bg = p.bg_light }),
		WhichKeyBorder({ fg = p.border, bg = p.bg_light }),
		WhichKeyValue({ fg = p.string }),

		-- Indent Blankline
		IndentBlanklineChar({ fg = p.bg_darker }),
		IndentBlanklineContextChar({ fg = p.fg_dark }),
		IndentBlanklineContextStart({ gui = "underline", sp = p.fg_dark }),
		IndentBlanklineSpaceChar({ fg = p.bg_darker }),
		IndentBlanklineSpaceCharBlankline({ fg = p.bg_darker }),
		IblIndent({ fg = p.bg_darker }),
		IblScope({ fg = p.fg_dark }),
		IblWhitespace({ fg = p.bg_darker }),

		-- Neo-tree
		NeoTreeNormal({ bg = p.bg, fg = p.fg }),
		NeoTreeNormalNC({ bg = p.bg, fg = p.fg }),
		NeoTreeDirectoryIcon({ fg = p.number }),
		NeoTreeDirectoryName({ fg = p.fg }),
		NeoTreeFileName({ fg = p.fg }),
		NeoTreeFileNameOpened({ fg = p.number, gui = "bold" }),
		NeoTreeFloatBorder({ fg = p.border, bg = p.bg_light }),
		NeoTreeFloatTitle({ fg = p.keyword, bg = p.bg_light, gui = "bold" }),
		NeoTreeGitAdded({ fg = p.hint }),
		NeoTreeGitConflict({ fg = p.error }),
		NeoTreeGitDeleted({ fg = p.error }),
		NeoTreeGitIgnored({ fg = p.fg_dark }),
		NeoTreeGitModified({ fg = p.warning }),
		NeoTreeGitUnstaged({ fg = p.warning }),
		NeoTreeGitUntracked({ fg = p.hint }),
		NeoTreeGitStaged({ fg = p.hint }),
		NeoTreeIndentMarker({ fg = p.bg_darker }),
		NeoTreeRootName({ fg = p.keyword, gui = "bold" }),
		NeoTreeSymbolicLinkTarget({ fg = p.blue }),
		NeoTreeTitleBar({ fg = p.keyword, bg = p.bg_light, gui = "bold" }),
		NeoTreeWindowsHidden({ fg = p.fg_dark }),

		-- Trouble
		TroubleNormal({ bg = p.bg_light, fg = p.fg }),
		TroubleText({ fg = p.fg }),
		TroubleCount({ fg = p.constant, gui = "bold" }),
		TroubleCode({ fg = p.fg_comment }),
		TroubleFile({ fg = p.number }),
		TroubleDirectory({ fg = p.type_name }),
		TroubleSource({ fg = p.fg_comment }),
		TroubleLocation({ fg = p.fg_dark }),
		TroubleIndent({ fg = p.bg_darker }),
		TroubleFoldIcon({ fg = p.fg_dark }),
		TroubleSignError({ fg = p.error }),
		TroubleSignWarning({ fg = p.warning }),
		TroubleSignInformation({ fg = p.info }),
		TroubleSignHint({ fg = p.hint }),
		TroubleError({ fg = p.error }),
		TroubleWarning({ fg = p.warning }),
		TroubleInformation({ fg = p.info }),
		TroubleHint({ fg = p.hint }),

		-- Mason
		MasonNormal({ bg = p.bg_light, fg = p.fg }),
		MasonHeader({ fg = p.keyword, bg = p.bg_darker, gui = "bold" }),
		MasonHeaderSecondary({ fg = p.function_call, bg = p.bg_darker, gui = "bold" }),
		MasonHighlight({ fg = p.function_call }),
		MasonHighlightBlock({ fg = p.bg, bg = p.function_call }),
		MasonHighlightBlockBold({ fg = p.bg, bg = p.function_call, gui = "bold" }),
		MasonHighlightSecondary({ fg = p.number }),
		MasonHighlightBlockSecondary({ fg = p.bg, bg = p.number }),
		MasonHighlightBlockBoldSecondary({ fg = p.bg, bg = p.number, gui = "bold" }),
		MasonMuted({ fg = p.fg_dark }),
		MasonMutedBlock({ fg = p.bg, bg = p.fg_dark }),
		MasonMutedBlockBold({ fg = p.bg, bg = p.fg_dark, gui = "bold" }),
		MasonError({ fg = p.error }),
		MasonWarning({ fg = p.warning }),
		MasonHeading({ fg = p.keyword, gui = "bold" }),

		-- Alpha/Dashboard
		AlphaHeader({ fg = p.function_call, gui = "bold" }),
		AlphaButtons({ fg = p.keyword }),
		AlphaShortcut({ fg = p.number, gui = "bold" }),
		AlphaFooter({ fg = p.fg_comment, gui = "italic" }),

		-- Hop/Leap (Jump Navigation)
		HopNextKey({ fg = p.error, gui = "bold" }),
		HopNextKey1({ fg = p.function_call, gui = "bold" }),
		HopNextKey2({ fg = p.number }),
		HopUnmatched({ fg = p.fg_dark }),
		LeapMatch({ fg = p.error, gui = "bold,underline" }),
		LeapLabelPrimary({ fg = p.error, gui = "bold" }),
		LeapLabelSecondary({ fg = p.function_call, gui = "bold" }),
		LeapBackdrop({ fg = p.fg_dark }),

		-- Notify
		NotifyERRORBorder({ fg = p.error }),
		NotifyWARNBorder({ fg = p.warning }),
		NotifyINFOBorder({ fg = p.info }),
		NotifyDEBUGBorder({ fg = p.fg_dark }),
		NotifyTRACEBorder({ fg = p.constant }),
		NotifyERRORIcon({ fg = p.error }),
		NotifyWARNIcon({ fg = p.warning }),
		NotifyINFOIcon({ fg = p.info }),
		NotifyDEBUGIcon({ fg = p.fg_dark }),
		NotifyTRACEIcon({ fg = p.constant }),
		NotifyERRORTitle({ fg = p.error, gui = "bold" }),
		NotifyWARNTitle({ fg = p.warning, gui = "bold" }),
		NotifyINFOTitle({ fg = p.info, gui = "bold" }),
		NotifyDEBUGTitle({ fg = p.fg_dark, gui = "bold" }),
		NotifyTRACETitle({ fg = p.constant, gui = "bold" }),

		-- Diff
		DiffAdd({ bg = p.diff_add }),
		DiffChange({ bg = p.diff_modified }),
		DiffDelete({ bg = p.diff_delete }),
		DiffText({ bg = p.warning, fg = p.bg }),

		-- Neogit
		NeogitBranch({ fg = p.constant }),
		NeogitRemote({ fg = p.number }),
		NeogitHunkHeader({ bg = p.bg_light, fg = p.fg }),
		NeogitHunkHeaderHighlight({ bg = p.bg_visual, fg = p.keyword }),
		NeogitDiffContextHighlight({ bg = p.bg_current_line }),
		NeogitDiffDeleteHighlight({ bg = p.diff_delete }),
		NeogitDiffAddHighlight({ bg = p.diff_add }),
	}
end)
---@diagnostic enable: undefined-global
