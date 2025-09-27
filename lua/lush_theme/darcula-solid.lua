-- darcula-solid.nvim
-- A Neovim theme inspired by the JetBrains Darcula theme.
-- Author: brianpooe
-- License: MIT
-- Updated based on canonical JetBrains Darcula specification.

local lush = require("lush")
local hsl = lush.hsl

-- The Canonical JetBrains Darcula Color Palette
-- Sourced from the official Darcula Look and Feel implementation.
local p = {
	-- Editor and UI Colors
	editor_bg = hsl("#2B2B2B"), -- The primary background color of the code editor pane.
	ui_bg = hsl("#3C3F41"), -- Background for UI elements like sidebars, status bars, and tool windows.
	gutter_bg = hsl("#313335"), -- Background for the editor gutter where line numbers are displayed.
	current_line_bg = hsl("#323232"), -- A slightly lighter shade for the current line background.
	selection_bg = hsl("#214283"), -- The background color for selected text.
	search_result_bg = hsl("#32593D"), -- Background color for the primary search result.
	other_search_results_bg = hsl("#4D4D2F"), -- Background for other occurrences of a search term.

	-- Foreground Colors
	fg = hsl("#A9B7C6"), -- The default color for plain text, parameters, and general code.
	gutter_fg = hsl("#606366"), -- The color of line numbers in the gutter.
	comment = hsl("#808080"), -- Used for all code comments (line and block).
	white = hsl("#FFFFFF"), -- Pure white for high contrast text on dark selections.

	-- Syntax Colors
	keyword = hsl("#CC7832"), -- Keywords (if, for, return), storage classes (static, const).
	string = hsl("#6A8759"), -- All string literals and character constants.
	number = hsl("#6897BB"), -- Integer, float, and other numeric constants.
	function_call = hsl("#FFC66D"), -- The color used for function and method invocations.
	annotation = hsl("#BBB529"), -- Annotations (Java), decorators (Python), attributes (Rust).
	constant = hsl("#9876AA"), -- Named constants, enumeration members.
	member_variable = hsl("#9876AA"), -- Instance or class-level variables and properties. Often italicized.

	-- Diagnostic Colors
	error = hsl("#BC3F3C"), -- Color for error text and squiggly underlines.
	warning = hsl("#BE9117"), -- Color for warning text and squiggly underlines.
	info = hsl("#525A52"), -- Color for informational diagnostic underlines.
	error_bg = hsl("#562B2C"), -- A subtle background for error text.
	warning_bg = hsl("#554825"), -- A subtle background for warning text.
	info_bg = hsl("#354736"), -- A subtle background for info text.

	-- Diff Colors
	diff_add = hsl("#4A8F4A"), -- Background color for added lines in a diff view.
	diff_mod = hsl("#385570"), -- Background color for modified lines in a diff view.
	diff_del = hsl("#632F34"), -- Background color for deleted lines in a diff view.
	diff_text_bg = hsl("#4A6E8E"), -- Background for specific changed text within a modified line.
	diff_text = hsl("#A9B7C6"), -- Text color for diffs, typically the default foreground.

	-- UI Border
	border = hsl("#515658"), -- A slightly lighter border for active UI elements.
}

-- Terminal colors for integrated terminal, aligned with the Darcula palette
vim.g.terminal_color_0 = "#2B2B2B" -- black (editor_bg)
vim.g.terminal_color_1 = "#BC3F3C" -- red (error)
vim.g.terminal_color_2 = "#6A8759" -- green (string)
vim.g.terminal_color_3 = "#FFC66D" -- yellow (function_call)
vim.g.terminal_color_4 = "#6897BB" -- blue (number)
vim.g.terminal_color_5 = "#9876AA" -- magenta (constant)
vim.g.terminal_color_6 = "#6897BB" -- cyan (number)
vim.g.terminal_color_7 = "#A9B7C6" -- white (fg)
vim.g.terminal_color_8 = "#606366" -- bright black (gutter_fg)
vim.g.terminal_color_9 = "#CC7832" -- bright red (keyword)
vim.g.terminal_color_10 = "#A9B7C6" -- bright green (fg)
vim.g.terminal_color_11 = "#BBB529" -- bright yellow (annotation)
vim.g.terminal_color_12 = "#A9B7C6" -- bright blue (fg)
vim.g.terminal_color_13 = "#9876AA" -- bright magenta (constant)
vim.g.terminal_color_14 = "#6897BB" -- bright cyan (number)
vim.g.terminal_color_15 = "#FFFFFF" -- bright white (white)

-- The theme definition using lush.nvim
return lush(function()
	return {
		-- == Neovim UI Groups == --
		Normal({ bg = p.editor_bg, fg = p.fg }),
		NormalNC({ bg = p.editor_bg, fg = p.fg }), -- Non-current windows
		NormalFloat({ bg = p.ui_bg, fg = p.fg }), -- Floating windows
		FloatBorder({ bg = p.ui_bg, fg = p.border }),
		SignColumn({ bg = p.gutter_bg, fg = p.gutter_fg }),
		LineNr({ bg = p.gutter_bg, fg = p.gutter_fg }),
		CursorLineNr({ bg = p.gutter_bg, fg = p.fg, style = "bold" }),
		CursorLine({ bg = p.current_line_bg }),
		CursorColumn({ bg = p.current_line_bg }),
		ColorColumn({ bg = p.current_line_bg }),

		Visual({ bg = p.selection_bg }),
		VisualNOS({ bg = p.selection_bg }),

		Pmenu({ bg = p.ui_bg, fg = p.fg }),
		PmenuSel({ bg = p.selection_bg, fg = p.white }),
		PmenuSbar({ bg = p.ui_bg }),
		PmenuThumb({ bg = p.gutter_fg }),

		StatusLine({ bg = p.ui_bg, fg = p.fg, style = "NONE" }),
		StatusLineNC({ bg = p.gutter_bg, fg = p.gutter_fg }),
		TabLine({ bg = p.gutter_bg, fg = p.gutter_fg }),
		TabLineFill({ bg = p.gutter_bg }),
		TabLineSel({ bg = p.ui_bg, fg = p.white }),

		VertSplit({ fg = p.gutter_fg, bg = p.editor_bg }),
		WinSeparator({ fg = p.gutter_fg, bg = p.editor_bg }),

		Search({ bg = p.search_result_bg, fg = p.white }),
		IncSearch({ bg = p.other_search_results_bg, fg = p.white }),
		CurSearch({ link = "IncSearch" }),
		Substitute({ bg = p.warning, fg = p.editor_bg }),

		Title({ fg = p.function_call, style = "bold" }),
		Directory({ fg = p.number }),
		ErrorMsg({ fg = p.error }),
		WarningMsg({ fg = p.warning }),
		MoreMsg({ fg = p.string }),
		Question({ fg = p.number }),
		ModeMsg({ fg = p.fg, style = "bold" }),
		Conceal({ fg = p.gutter_fg, bg = p.editor_bg }),
		Folded({ fg = p.comment, bg = p.editor_bg }),
		FoldColumn({ bg = p.gutter_bg, fg = p.gutter_fg }),

		MatchParen({ bg = p.selection_bg, fg = p.function_call, style = "bold" }),
		NonText({ fg = p.gutter_fg }),
		SpecialKey({ fg = p.gutter_fg }),
		Whitespace({ fg = p.gutter_fg }),
		EndOfBuffer({ fg = p.editor_bg }),

		-- Spell checking
		SpellBad({ sp = p.error, style = "undercurl" }),
		SpellCap({ sp = p.warning, style = "undercurl" }),
		SpellLocal({ sp = p.number, style = "undercurl" }),
		SpellRare({ sp = p.constant, style = "undercurl" }),

		-- == Standard Syntax Groups (Fallback for no Tree-sitter) == --
		Comment({ fg = p.comment, style = "italic" }),
		String({ fg = p.string }),
		Number({ fg = p.number }),
		Constant({ fg = p.constant }),
		Character({ fg = p.string }),
		Boolean({ fg = p.keyword }),

		Keyword({ fg = p.keyword }),
		Statement({ fg = p.keyword }),
		Operator({ fg = p.fg }),
		Conditional({ fg = p.keyword }),
		Repeat({ fg = p.keyword }),

		Identifier({ fg = p.fg }),
		Function({ fg = p.function_call }),
		Type({ fg = p.fg }),
		StorageClass({ fg = p.keyword }),
		Structure({ fg = p.keyword }),
		Typedef({ fg = p.keyword }),
		PreProc({ fg = p.keyword }),
		Include({ fg = p.keyword }),
		Define({ fg = p.keyword }),
		Macro({ fg = p.annotation }),

		Special({ fg = p.constant }),
		SpecialChar({ fg = p.constant }),
		SpecialComment({ fg = p.comment, style = "italic" }),
		Todo({ bg = p.ui_bg, fg = p.string, style = "bold" }),
		Underlined({ fg = p.number, style = "underline" }),
		Error({ fg = p.error }),

		-- == Complete Tree-sitter Highlight Groups (Aligned with JetBrains Darcula) == --
		-- Comments
		["@comment"] = { fg = p.comment, style = "italic" },
		["@comment.documentation"] = { fg = p.comment, style = "italic" },
		["@comment.todo"] = { fg = p.string, bg = p.ui_bg, style = "bold" },
		["@comment.warning"] = { fg = p.warning, bg = p.warning_bg, style = "bold" },
		["@comment.error"] = { fg = p.error, bg = p.error_bg, style = "bold" },
		["@comment.note"] = { fg = p.number, bg = p.info_bg, style = "bold" },

		-- Strings
		["@string"] = { fg = p.string },
		["@string.documentation"] = { fg = p.string, style = "italic" },
		["@string.regex"] = { fg = p.constant },
		["@string.escape"] = { fg = p.keyword },
		["@string.special"] = { fg = p.constant },
		["@character"] = { fg = p.string },
		["@character.special"] = { fg = p.constant },

		-- Numbers and Booleans
		["@number"] = { fg = p.number },
		["@boolean"] = { fg = p.keyword },
		["@float"] = { fg = p.number },

		-- Functions and Methods
		["@function"] = { fg = p.fg }, -- Definitions are default color
		["@function.builtin"] = { fg = p.function_call },
		["@function.call"] = { fg = p.function_call },
		["@function.macro"] = { fg = p.annotation },
		["@method"] = { fg = p.fg }, -- Definitions are default color
		["@method.call"] = { fg = p.function_call },

		["@constructor"] = { fg = p.fg },
		["@parameter"] = { fg = p.fg },
		["@parameter.reference"] = { fg = p.fg, style = "italic" },

		-- Keywords
		["@keyword"] = { fg = p.keyword },
		["@keyword.function"] = { fg = p.keyword },
		["@keyword.operator"] = { fg = p.keyword },
		["@keyword.return"] = { fg = p.keyword },
		["@keyword.import"] = { fg = p.keyword },
		["@keyword.storage"] = { fg = p.keyword },
		["@keyword.directive"] = { fg = p.keyword },
		["@keyword.directive.define"] = { fg = p.keyword },

		["@conditional"] = { fg = p.keyword },
		["@repeat"] = { fg = p.keyword },
		["@label"] = { fg = p.annotation },
		["@operator"] = { fg = p.fg },
		["@exception"] = { fg = p.keyword },

		-- Types
		["@type"] = { fg = p.fg },
		["@type.builtin"] = { fg = p.keyword },
		["@type.qualifier"] = { fg = p.keyword },
		["@type.definition"] = { fg = p.fg },
		["@storageclass"] = { fg = p.keyword },
		["@attribute"] = { fg = p.annotation },
		["@field"] = { fg = p.member_variable, style = "italic" },
		["@property"] = { fg = p.member_variable, style = "italic" },

		-- Variables and Constants
		["@variable"] = { fg = p.fg },
		["@variable.builtin"] = { fg = p.constant, style = "italic" },
		["@variable.parameter"] = { fg = p.fg },
		["@variable.member"] = { fg = p.member_variable, style = "italic" },
		["@constant"] = { fg = p.constant },
		["@constant.builtin"] = { fg = p.constant },
		["@constant.macro"] = { fg = p.constant },

		-- Namespaces and Includes
		["@module"] = { fg = p.fg },
		["@namespace"] = { fg = p.fg },
		["@symbol"] = { fg = p.fg },
		["@annotation"] = { fg = p.annotation },
		["@include"] = { fg = p.keyword },
		["@preproc"] = { fg = p.keyword },
		["@define"] = { fg = p.keyword },
		["@macro"] = { fg = p.annotation },

		-- Punctuation
		["@punctuation.delimiter"] = { fg = p.fg },
		["@punctuation.bracket"] = { fg = p.fg },
		["@punctuation.special"] = { fg = p.keyword },

		-- Markup (for markdown, etc.)
		["@text.title"] = { fg = p.function_call, style = "bold" },
		["@text.uri"] = { fg = p.string, style = "underline" },
		["@text.literal"] = { fg = p.string },
		["@text.strong"] = { style = "bold" },
		["@text.emphasis"] = { style = "italic" },
		["@text.strike"] = { style = "strikethrough" },
		["@text.underline"] = { style = "underline" },
		["@text.quote"] = { fg = p.comment, style = "italic" },
		["@text.todo"] = { fg = p.string, bg = p.ui_bg, style = "bold" },
		["@text.warning"] = { fg = p.warning, style = "bold" },
		["@text.danger"] = { fg = p.error, style = "bold" },
		["@text.note"] = { fg = p.number, style = "bold" },

		-- Tags (HTML/XML)
		["@tag"] = { fg = p.fg },
		["@tag.attribute"] = { fg = p.member_variable },
		["@tag.delimiter"] = { fg = p.fg },

		-- Diff (Tree-sitter)
		["@text.diff.add"] = { bg = p.diff_add },
		["@text.diff.delete"] = { bg = p.diff_del },
		["@text.diff.change"] = { bg = p.diff_mod },

		-- == LSP Semantic Token Support == --
		["@lsp.type.class"] = { fg = p.fg },
		["@lsp.type.struct"] = { fg = p.fg },
		["@lsp.type.enum"] = { fg = p.fg },
		["@lsp.type.enumMember"] = { fg = p.constant },
		["@lsp.type.interface"] = { fg = p.fg, style = "italic" },
		["@lsp.type.typeParameter"] = { fg = p.fg },
		["@lsp.type.namespace"] = { fg = p.fg },
		["@lsp.type.parameter"] = { fg = p.fg },
		["@lsp.type.variable"] = { fg = p.fg },
		["@lsp.type.property"] = { fg = p.member_variable, style = "italic" },
		["@lsp.type.function"] = { fg = p.fg },
		["@lsp.type.method"] = { fg = p.function_call },
		["@lsp.type.macro"] = { fg = p.annotation },
		["@lsp.type.keyword"] = { fg = p.keyword },
		["@lsp.type.comment"] = { fg = p.comment, style = "italic" },
		["@lsp.type.string"] = { fg = p.string },
		["@lsp.type.number"] = { fg = p.number },
		["@lsp.type.operator"] = { fg = p.fg },
		["@lsp.type.decorator"] = { fg = p.annotation },

		-- LSP Modifiers
		["@lsp.mod.deprecated"] = { style = "strikethrough" },
		["@lsp.mod.static"] = { style = "italic" },
		["@lsp.mod.async"] = { style = "italic" },
		["@lsp.mod.readonly"] = { fg = p.constant },

		-- == LSP Diagnostics == --
		DiagnosticError({ fg = p.error }),
		DiagnosticWarn({ fg = p.warning }),
		DiagnosticInfo({ fg = p.fg }),
		DiagnosticHint({ fg = p.string }),

		DiagnosticVirtualTextError({ fg = p.error, bg = p.error_bg }),
		DiagnosticVirtualTextWarn({ fg = p.warning, bg = p.warning_bg }),
		DiagnosticVirtualTextInfo({ fg = p.fg, bg = p.info_bg }),

		DiagnosticUnderlineError({ sp = p.error, style = "undercurl" }),
		DiagnosticUnderlineWarn({ sp = p.warning, style = "undercurl" }),
		DiagnosticUnderlineInfo({ sp = p.info, style = "undercurl" }),
		DiagnosticUnderlineHint({ sp = p.string, style = "undercurl" }),

		DiagnosticSignError({ fg = p.error, bg = p.gutter_bg }),
		DiagnosticSignWarn({ fg = p.warning, bg = p.gutter_bg }),
		DiagnosticSignInfo({ fg = p.number, bg = p.gutter_bg }),
		DiagnosticSignHint({ fg = p.string, bg = p.gutter_bg }),

		-- Legacy LSP Diagnostics Links
		LspDiagnosticsDefaultError({ link = "DiagnosticError" }),
		LspDiagnosticsDefaultWarning({ link = "DiagnosticWarn" }),
		LspDiagnosticsDefaultInformation({ link = "DiagnosticInfo" }),
		LspDiagnosticsDefaultHint({ link = "DiagnosticHint" }),
		LspDiagnosticsUnderlineError({ link = "DiagnosticUnderlineError" }),
		LspDiagnosticsUnderlineWarning({ link = "DiagnosticUnderlineWarn" }),
		LspDiagnosticsUnderlineInformation({ link = "DiagnosticUnderlineInfo" }),
		LspDiagnosticsUnderlineHint({ link = "DiagnosticUnderlineHint" }),

		-- == Plugin Support == --
		-- NvimTree
		NvimTreeNormal({ bg = p.editor_bg, fg = p.fg }),
		NvimTreeVertSplit({ fg = p.gutter_fg, bg = p.editor_bg }),
		NvimTreeRootFolder({ fg = p.function_call, style = "bold" }),
		NvimTreeFolderIcon({ fg = p.number }),
		NvimTreeSymlink({ fg = p.number, style = "underline" }),
		NvimTreeGitDirty({ fg = p.warning }),
		NvimTreeGitStaged({ fg = p.string }),
		NvimTreeGitNew({ fg = p.string }),
		NvimTreeGitDeleted({ fg = p.error }),

		-- Telescope
		TelescopeNormal({ bg = p.ui_bg, fg = p.fg }),
		TelescopeBorder({ fg = p.border, bg = p.ui_bg }),
		TelescopePromptTitle({ fg = p.keyword, bg = p.ui_bg, style = "bold" }),
		TelescopePreviewTitle({ fg = p.keyword, bg = p.editor_bg, style = "bold" }),
		TelescopeSelection({ bg = p.selection_bg, fg = p.fg }),
		TelescopeMatching({ fg = p.function_call, style = "bold" }),

		-- nvim-cmp
		CmpItemAbbr({ fg = p.fg }),
		CmpItemAbbrDeprecated({ fg = p.gutter_fg, style = "strikethrough" }),
		CmpItemAbbrMatch({ fg = p.function_call, style = "bold" }),
		CmpItemAbbrMatchFuzzy({ fg = p.function_call, style = "bold" }),
		CmpItemKind({ fg = p.constant }),
		CmpItemKindMethod({ fg = p.function_call }),
		CmpItemKindFunction({ fg = p.function_call }),
		CmpItemKindConstructor({ fg = p.annotation }),
		CmpItemKindField({ fg = p.member_variable }),
		CmpItemKindProperty({ fg = p.member_variable }),
		CmpItemKindKeyword({ fg = p.keyword }),
		CmpItemKindSnippet({ fg = p.string }),
		CmpItemKindConstant({ fg = p.constant }),
		CmpItemKindEnumMember({ fg = p.constant }),

		-- GitSigns & Diff
		GitSignsAdd({ fg = p.string }),
		GitSignsChange({ fg = p.warning }),
		GitSignsDelete({ fg = p.error }),
		GitSignsCurrentLineBlame({ fg = p.comment }),
		DiffAdd({ bg = p.diff_add }),
		DiffChange({ bg = p.diff_mod }),
		DiffDelete({ bg = p.diff_del }),
		DiffText({ bg = p.diff_text_bg }),

		-- indent-blankline
		IndentBlanklineChar({ fg = p.gutter_bg }),
		IndentBlanklineContextChar({ fg = p.border }),
	}
end)
