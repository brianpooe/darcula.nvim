-- darcula-solid.nvim
-- A Neovim theme inspired by the JetBrains Darcula theme.
-- Author: brianpooe
-- License: MIT

local lush = require("lush")
local hsl = lush.hsl

-- The official Darcula color palette
-- Sourced from JetBrains IDEs official specifications
local p = {
	-- Base Colors (Updated to match JetBrains exactly)
	bg = hsl("#2B2B2B"), -- Editor background
	bg_light = hsl("#3C3F41"), -- UI elements like statusline, popups
	bg_darker = hsl("#242424"), -- Darker background for some UI elements
	bg_gutter = hsl("#313335"), -- Gutter background
	bg_visual = hsl("#214283"), -- Visual selection background
	bg_search = hsl("#32593D"), -- Search highlight
	bg_current_line = hsl("#323232"), -- Current line background

	fg = hsl("#A9B7C6"), -- Default foreground
	fg_dark = hsl("#606366"), -- Gutter numbers, inactive elements
	fg_comment = hsl("#808080"), -- Comments
	fg_light = hsl("#BBBBBB"), -- Lighter text

	-- Syntax Colors (Refined to match JetBrains)
	orange = hsl("#CC7832"), -- Keywords (if, else, for), statements
	yellow = hsl("#FFC66D"), -- Functions, methods
	yellow_dark = hsl("#BBB529"), -- Macros
	green = hsl("#6A8759"), -- Strings (darker green)
	green_bright = hsl("#A5C25C"), -- Alternative string color (brighter)
	purple = hsl("#9876AA"), -- Variables, properties, constants
	purple_dark = hsl("#94558D"), -- Builtin variables
	cyan = hsl("#6897BB"), -- Numbers
	cyan_bright = hsl("#5394EC"), -- Info, links
	pink = hsl("#CB77B4"), -- Tags, annotations
	blue = hsl("#287BDE"), -- Links, special blues
	blue_dark = hsl("#4A86C7"), -- Darker blue variant
	white = hsl("#FFFFFF"),

	-- Additional semantic colors
	gray = hsl("#606060"), -- Various UI elements
	gray_light = hsl("#767676"), -- Lighter gray
	brown = hsl("#A68A64"), -- Special uses

	-- Diagnostic Colors (JetBrains spec)
	error = hsl("#C75450"), -- More accurate error color
	error_bg = hsl("#3D2929"), -- Error background
	warning = hsl("#D6BF55"), -- Updated warning
	warning_bg = hsl("#3D3D29"), -- Warning background
	info = hsl("#5394EC"),
	info_bg = hsl("#293D48"), -- Info background
	hint = hsl("#499C54"), -- Success/hint green
	hint_bg = hsl("#294F33"), -- Hint background

	-- Diff colors
	diff_add = hsl("#294F33"),
	diff_change = hsl("#3D3D0A"),
	diff_delete = hsl("#484A4A"),
	diff_text = hsl("#656E76"),

	-- UI Border
	border = hsl("#616161"),
	border_dark = hsl("#424242"),
}

-- Terminal colors for integrated terminal
vim.g.terminal_color_0 = "#2B2B2B" -- black
vim.g.terminal_color_1 = "#FF6B68" -- red
vim.g.terminal_color_2 = "#A8C023" -- green
vim.g.terminal_color_3 = "#D6BF55" -- yellow
vim.g.terminal_color_4 = "#5394EC" -- blue
vim.g.terminal_color_5 = "#AE8ABE" -- magenta
vim.g.terminal_color_6 = "#299999" -- cyan
vim.g.terminal_color_7 = "#A9B7C6" -- white
vim.g.terminal_color_8 = "#606366" -- bright black
vim.g.terminal_color_9 = "#FF9980" -- bright red
vim.g.terminal_color_10 = "#C3D82C" -- bright green
vim.g.terminal_color_11 = "#FFFF00" -- bright yellow
vim.g.terminal_color_12 = "#6FB3D2" -- bright blue
vim.g.terminal_color_13 = "#D197D9" -- bright magenta
vim.g.terminal_color_14 = "#4DD0E1" -- bright cyan
vim.g.terminal_color_15 = "#FFFFFF" -- bright white

-- The theme definition using lush.nvim
return lush(function()
	return {
		-- == Neovim UI Groups == --
		Normal({ bg = p.bg, fg = p.fg }),
		NormalNC({ bg = p.bg, fg = p.fg }), -- Non-current windows
		NormalFloat({ bg = p.bg_light, fg = p.fg }), -- Floating windows
		FloatBorder({ bg = p.bg_light, fg = p.border }),
		SignColumn({ bg = p.bg, fg = p.fg_dark }),
		LineNr({ bg = p.bg, fg = p.fg_dark }),
		CursorLineNr({ bg = p.bg, fg = p.yellow, style = "bold" }),
		CursorLine({ bg = p.bg_current_line }),
		CursorColumn({ bg = p.bg_current_line }),
		ColorColumn({ bg = p.bg_light }),

		Visual({ bg = p.bg_visual }),
		VisualNOS({ bg = p.bg_visual }),

		Pmenu({ bg = p.bg_light, fg = p.fg }),
		PmenuSel({ bg = p.bg_visual, fg = p.white }),
		PmenuSbar({ bg = p.bg_light }),
		PmenuThumb({ bg = p.fg_dark }),

		StatusLine({ bg = p.bg_light, fg = p.fg }),
		StatusLineNC({ bg = p.bg_gutter, fg = p.fg_dark }),
		TabLine({ bg = p.bg_gutter, fg = p.fg_dark }),
		TabLineFill({ bg = p.bg_gutter }),
		TabLineSel({ bg = p.bg_light, fg = p.white }),

		VertSplit({ fg = p.border_dark, bg = p.bg }),
		WinSeparator({ fg = p.border_dark, bg = p.bg }),

		Search({ bg = p.bg_search, fg = p.white }),
		IncSearch({ bg = hsl("#474131"), fg = p.yellow }),
		CurSearch({ link = "IncSearch" }),
		Substitute({ bg = p.warning, fg = p.bg }),

		Title({ fg = p.orange, style = "bold" }),
		Directory({ fg = p.cyan }),
		ErrorMsg({ fg = p.error }),
		WarningMsg({ fg = p.warning }),
		MoreMsg({ fg = p.green_bright }),
		Question({ fg = p.cyan }),
		ModeMsg({ fg = p.fg, style = "bold" }),
		Conceal({ fg = p.fg_dark, bg = p.bg }),
		Folded({ fg = p.fg_comment, bg = p.bg_darker }),
		FoldColumn({ bg = p.bg, fg = p.fg_dark }),

		MatchParen({ bg = p.gray, fg = p.yellow }),
		NonText({ fg = p.fg_dark }),
		SpecialKey({ fg = p.gray }),
		Whitespace({ fg = p.gray }),
		EndOfBuffer({ fg = p.bg }),

		-- Spell checking
		SpellBad({ sp = p.error, style = "undercurl" }),
		SpellCap({ sp = p.warning, style = "undercurl" }),
		SpellLocal({ sp = p.info, style = "undercurl" }),
		SpellRare({ sp = p.hint, style = "undercurl" }),

		-- == Standard Syntax Groups (Fallback for no Tree-sitter) == --
		Comment({ fg = p.fg_comment, style = "italic" }),
		String({ fg = p.green_bright }),
		Number({ fg = p.cyan }),
		Constant({ fg = p.purple }),
		Character({ fg = p.green_bright }),
		Boolean({ fg = p.orange, style = "italic" }),

		Keyword({ fg = p.orange, style = "bold" }),
		Statement({ fg = p.orange, style = "bold" }),
		Operator({ fg = p.fg }),
		Conditional({ fg = p.orange, style = "bold" }),
		Repeat({ fg = p.orange, style = "bold" }),

		Identifier({ fg = p.fg }),
		Function({ fg = p.yellow }),
		Type({ fg = p.fg }),
		StorageClass({ fg = p.orange }),
		Structure({ fg = p.orange }),
		Typedef({ fg = p.orange }),
		PreProc({ fg = p.orange }),
		Include({ fg = p.orange }),
		Define({ fg = p.orange }),
		Macro({ fg = p.yellow_dark }),

		Special({ fg = p.pink }),
		SpecialChar({ fg = p.pink }),
		SpecialComment({ fg = p.gray_light, style = "italic" }),
		Todo({ bg = p.bg_darker, fg = p.green_bright, style = "bold" }),
		Underlined({ fg = p.blue, style = "underline" }),
		Error({ fg = p.error }),

		-- == Complete Tree-sitter Highlight Groups == --
		-- Comments
		["@comment"] = { fg = p.fg_comment, style = "italic" },
		["@comment.documentation"] = { fg = p.fg_comment, style = "italic" },
		["@comment.todo"] = { fg = p.green_bright, bg = p.bg_darker, style = "bold" },
		["@comment.warning"] = { fg = p.warning, bg = p.warning_bg, style = "bold" },
		["@comment.error"] = { fg = p.error, bg = p.error_bg, style = "bold" },
		["@comment.note"] = { fg = p.info, bg = p.info_bg, style = "bold" },

		-- Strings
		["@string"] = { fg = p.green_bright },
		["@string.documentation"] = { fg = p.green_bright, style = "italic" },
		["@string.regex"] = { fg = p.pink },
		["@string.escape"] = { fg = p.pink },
		["@string.special"] = { fg = p.pink },
		["@character"] = { fg = p.green_bright },
		["@character.special"] = { fg = p.pink },

		-- Numbers and Booleans
		["@number"] = { fg = p.cyan },
		["@boolean"] = { fg = p.orange, style = "italic" },
		["@float"] = { fg = p.cyan },

		-- Functions and Methods
		["@function"] = { fg = p.yellow },
		["@function.builtin"] = { fg = p.blue_dark, style = "italic" },
		["@function.call"] = { fg = p.fg },
		["@function.macro"] = { fg = p.yellow_dark },
		["@function.method"] = { fg = p.yellow },
		["@function.method.call"] = { fg = p.fg },

		["@method"] = { fg = p.yellow },
		["@method.call"] = { fg = p.fg },

		["@constructor"] = { fg = p.yellow },
		["@parameter"] = { fg = p.fg },
		["@parameter.reference"] = { fg = p.fg, style = "italic" },

		-- Keywords
		["@keyword"] = { fg = p.orange, style = "bold" },
		["@keyword.function"] = { fg = p.orange, style = "bold" },
		["@keyword.operator"] = { fg = p.orange, style = "bold" },
		["@keyword.return"] = { fg = p.orange, style = "bold" },
		["@keyword.conditional"] = { fg = p.orange, style = "bold" },
		["@keyword.conditional.ternary"] = { fg = p.orange },
		["@keyword.repeat"] = { fg = p.orange, style = "bold" },
		["@keyword.import"] = { fg = p.orange, style = "bold" },
		["@keyword.storage"] = { fg = p.orange, style = "bold" },
		["@keyword.directive"] = { fg = p.orange },
		["@keyword.directive.define"] = { fg = p.orange },

		["@conditional"] = { fg = p.orange, style = "bold" },
		["@conditional.ternary"] = { fg = p.orange },
		["@repeat"] = { fg = p.orange, style = "bold" },
		["@label"] = { fg = p.pink },
		["@operator"] = { fg = p.fg },
		["@exception"] = { fg = p.orange, style = "bold" },

		-- Types
		["@type"] = { fg = p.fg },
		["@type.builtin"] = { fg = p.fg, style = "italic" },
		["@type.qualifier"] = { fg = p.orange },
		["@type.definition"] = { fg = p.fg },
		["@storageclass"] = { fg = p.orange },
		["@attribute"] = { fg = p.pink },
		["@field"] = { fg = p.purple },
		["@property"] = { fg = p.purple },

		-- Variables and Constants
		["@variable"] = { fg = p.fg },
		["@variable.builtin"] = { fg = p.purple_dark, style = "italic" },
		["@variable.parameter"] = { fg = p.fg },
		["@variable.member"] = { fg = p.purple },
		["@constant"] = { fg = p.purple },
		["@constant.builtin"] = { fg = p.purple, style = "italic" },
		["@constant.macro"] = { fg = p.purple },

		-- Namespaces and Includes
		["@module"] = { fg = p.fg },
		["@namespace"] = { fg = p.fg },
		["@symbol"] = { fg = p.purple },
		["@annotation"] = { fg = p.pink },
		["@include"] = { fg = p.orange, style = "bold" },
		["@preproc"] = { fg = p.orange },
		["@define"] = { fg = p.orange },
		["@macro"] = { fg = p.yellow_dark },

		-- Punctuation
		["@punctuation.delimiter"] = { fg = p.fg },
		["@punctuation.bracket"] = { fg = p.fg },
		["@punctuation.special"] = { fg = p.pink },

		-- Markup (for markdown, etc.)
		["@markup"] = { fg = p.fg },
		["@markup.heading"] = { fg = p.orange, style = "bold" },
		["@markup.heading.1"] = { fg = p.orange, style = "bold" },
		["@markup.heading.2"] = { fg = p.orange, style = "bold" },
		["@markup.heading.3"] = { fg = p.orange, style = "bold" },
		["@markup.heading.4"] = { fg = p.orange, style = "bold" },
		["@markup.heading.5"] = { fg = p.orange, style = "bold" },
		["@markup.heading.6"] = { fg = p.orange, style = "bold" },
		["@markup.list"] = { fg = p.cyan },
		["@markup.list.checked"] = { fg = p.hint },
		["@markup.list.unchecked"] = { fg = p.fg_dark },
		["@markup.bold"] = { style = "bold" },
		["@markup.italic"] = { style = "italic" },
		["@markup.strikethrough"] = { style = "strikethrough" },
		["@markup.underline"] = { style = "underline" },
		["@markup.link"] = { fg = p.blue, style = "underline" },
		["@markup.link.label"] = { fg = p.cyan, style = "underline" },
		["@markup.link.url"] = { fg = p.blue, style = "underline" },
		["@markup.raw"] = { fg = p.green_bright },
		["@markup.raw.block"] = { fg = p.green_bright },
		["@markup.quote"] = { fg = p.fg_comment, style = "italic" },
		["@markup.math"] = { fg = p.cyan },
		["@markup.environment"] = { fg = p.orange },
		["@markup.environment.name"] = { fg = p.orange },

		-- Tags (HTML/XML)
		["@tag"] = { fg = p.orange },
		["@tag.attribute"] = { fg = p.purple, style = "italic" },
		["@tag.delimiter"] = { fg = p.fg_dark },

		-- Text
		["@text"] = { fg = p.fg },
		["@text.strong"] = { style = "bold" },
		["@text.emphasis"] = { style = "italic" },
		["@text.underline"] = { style = "underline" },
		["@text.strike"] = { style = "strikethrough" },
		["@text.title"] = { fg = p.orange, style = "bold" },
		["@text.literal"] = { fg = p.green_bright },
		["@text.uri"] = { fg = p.blue, style = "underline" },
		["@text.reference"] = { fg = p.cyan },
		["@text.todo"] = { fg = p.green_bright, bg = p.bg_darker, style = "bold" },
		["@text.warning"] = { fg = p.warning, style = "bold" },
		["@text.danger"] = { fg = p.error, style = "bold" },
		["@text.note"] = { fg = p.info, style = "bold" },

		-- Diff (Tree-sitter)
		["@text.diff.add"] = { bg = p.diff_add },
		["@text.diff.delete"] = { bg = p.diff_delete, fg = p.diff_text },
		["@text.diff.change"] = { bg = p.diff_change },

		-- == LSP Semantic Token Support == --
		["@lsp.type.class"] = { fg = p.fg },
		["@lsp.type.struct"] = { fg = p.fg },
		["@lsp.type.enum"] = { fg = p.fg },
		["@lsp.type.enumMember"] = { fg = p.purple },
		["@lsp.type.interface"] = { fg = p.fg },
		["@lsp.type.typeParameter"] = { fg = p.fg },
		["@lsp.type.namespace"] = { fg = p.fg },
		["@lsp.type.parameter"] = { fg = p.fg },
		["@lsp.type.variable"] = { fg = p.fg },
		["@lsp.type.property"] = { fg = p.purple },
		["@lsp.type.event"] = { fg = p.purple },
		["@lsp.type.function"] = { fg = p.yellow },
		["@lsp.type.method"] = { fg = p.yellow },
		["@lsp.type.macro"] = { fg = p.yellow_dark },
		["@lsp.type.keyword"] = { fg = p.orange, style = "bold" },
		["@lsp.type.comment"] = { fg = p.fg_comment, style = "italic" },
		["@lsp.type.string"] = { fg = p.green_bright },
		["@lsp.type.number"] = { fg = p.cyan },
		["@lsp.type.regexp"] = { fg = p.pink },
		["@lsp.type.operator"] = { fg = p.fg },
		["@lsp.type.decorator"] = { fg = p.pink },

		-- LSP Modifiers
		["@lsp.mod.deprecated"] = { style = "strikethrough" },
		["@lsp.mod.readonly"] = { style = "italic" },
		["@lsp.mod.static"] = { style = "italic" },
		["@lsp.mod.abstract"] = { style = "italic" },
		["@lsp.mod.async"] = { style = "italic" },
		["@lsp.mod.documentation"] = { style = "italic" },
		["@lsp.mod.defaultLibrary"] = { style = "italic" },

		-- Combined type-modifier highlights
		["@lsp.typemod.function.readonly"] = { fg = p.yellow, style = "italic" },
		["@lsp.typemod.variable.readonly"] = { fg = p.purple, style = "italic" },
		["@lsp.typemod.variable.static"] = { fg = p.purple, style = "italic" },
		["@lsp.typemod.property.readonly"] = { fg = p.purple, style = "italic" },
		["@lsp.typemod.class.deprecated"] = { fg = p.fg, style = "strikethrough" },
		["@lsp.typemod.function.deprecated"] = { fg = p.yellow, style = "strikethrough" },

		-- == LSP Diagnostics == --
		DiagnosticError({ fg = p.error }),
		DiagnosticWarn({ fg = p.warning }),
		DiagnosticInfo({ fg = p.info }),
		DiagnosticHint({ fg = p.hint }),
		DiagnosticOk({ fg = p.hint }),

		DiagnosticVirtualTextError({ fg = p.error, bg = p.error_bg }),
		DiagnosticVirtualTextWarn({ fg = p.warning, bg = p.warning_bg }),
		DiagnosticVirtualTextInfo({ fg = p.info, bg = p.info_bg }),
		DiagnosticVirtualTextHint({ fg = p.hint, bg = p.hint_bg }),
		DiagnosticVirtualTextOk({ fg = p.hint, bg = p.hint_bg }),

		DiagnosticUnderlineError({ sp = p.error, style = "undercurl" }),
		DiagnosticUnderlineWarn({ sp = p.warning, style = "undercurl" }),
		DiagnosticUnderlineInfo({ sp = p.info, style = "undercurl" }),
		DiagnosticUnderlineHint({ sp = p.hint, style = "undercurl" }),
		DiagnosticUnderlineOk({ sp = p.hint, style = "undercurl" }),

		DiagnosticFloatingError({ fg = p.error, bg = p.bg_light }),
		DiagnosticFloatingWarn({ fg = p.warning, bg = p.bg_light }),
		DiagnosticFloatingInfo({ fg = p.info, bg = p.bg_light }),
		DiagnosticFloatingHint({ fg = p.hint, bg = p.bg_light }),
		DiagnosticFloatingOk({ fg = p.hint, bg = p.bg_light }),

		DiagnosticSignError({ fg = p.error, bg = p.bg }),
		DiagnosticSignWarn({ fg = p.warning, bg = p.bg }),
		DiagnosticSignInfo({ fg = p.info, bg = p.bg }),
		DiagnosticSignHint({ fg = p.hint, bg = p.bg }),
		DiagnosticSignOk({ fg = p.hint, bg = p.bg }),

		-- Legacy LSP Diagnostics (for compatibility)
		LspDiagnosticsDefaultError({ link = "DiagnosticError" }),
		LspDiagnosticsDefaultWarning({ link = "DiagnosticWarn" }),
		LspDiagnosticsDefaultInformation({ link = "DiagnosticInfo" }),
		LspDiagnosticsDefaultHint({ link = "DiagnosticHint" }),

		LspDiagnosticsVirtualTextError({ link = "DiagnosticVirtualTextError" }),
		LspDiagnosticsVirtualTextWarning({ link = "DiagnosticVirtualTextWarn" }),
		LspDiagnosticsVirtualTextInformation({ link = "DiagnosticVirtualTextInfo" }),
		LspDiagnosticsVirtualTextHint({ link = "DiagnosticVirtualTextHint" }),

		LspDiagnosticsUnderlineError({ link = "DiagnosticUnderlineError" }),
		LspDiagnosticsUnderlineWarning({ link = "DiagnosticUnderlineWarn" }),
		LspDiagnosticsUnderlineInformation({ link = "DiagnosticUnderlineInfo" }),
		LspDiagnosticsUnderlineHint({ link = "DiagnosticUnderlineHint" }),

		-- LSP References
		LspReferenceText({ bg = p.bg_darker }),
		LspReferenceRead({ bg = p.bg_darker }),
		LspReferenceWrite({ bg = p.bg_darker, style = "underline" }),

		-- LSP Code Lens
		LspCodeLens({ fg = p.gray_light }),
		LspCodeLensSeparator({ fg = p.gray }),

		-- == Plugin Support == --
		-- NvimTree
		NvimTreeNormal({ bg = p.bg, fg = p.fg }),
		NvimTreeVertSplit({ fg = p.border_dark, bg = p.bg }),
		NvimTreeWinSeparator({ fg = p.border_dark, bg = p.bg }),
		NvimTreeEndOfBuffer({ fg = p.bg }),
		NvimTreeFolderIcon({ fg = p.cyan }),
		NvimTreeFolderName({ fg = p.fg }),
		NvimTreeOpenedFolderName({ fg = p.cyan, style = "bold" }),
		NvimTreeEmptyFolderName({ fg = p.fg_dark }),
		NvimTreeRootFolder({ fg = p.orange, style = "bold" }),
		NvimTreeSpecialFile({ fg = p.yellow, style = "underline" }),
		NvimTreeExecFile({ fg = p.hint }),
		NvimTreeImageFile({ fg = p.purple }),
		NvimTreeSymlink({ fg = p.cyan, style = "underline" }),
		NvimTreeGitDirty({ fg = p.warning }),
		NvimTreeGitStaged({ fg = p.hint }),
		NvimTreeGitMerge({ fg = p.error }),
		NvimTreeGitNew({ fg = p.hint }),
		NvimTreeGitDeleted({ fg = p.error }),

		-- Telescope
		TelescopeNormal({ bg = p.bg_light, fg = p.fg }),
		TelescopeBorder({ fg = p.border, bg = p.bg_light }),
		TelescopePromptNormal({ bg = p.bg_light, fg = p.fg }),
		TelescopePromptBorder({ fg = p.border, bg = p.bg_light }),
		TelescopePromptTitle({ fg = p.orange, bg = p.bg_light, style = "bold" }),
		TelescopePromptPrefix({ fg = p.orange }),
		TelescopeResultsNormal({ bg = p.bg_light, fg = p.fg }),
		TelescopeResultsBorder({ fg = p.border, bg = p.bg_light }),
		TelescopeResultsTitle({ fg = p.orange, bg = p.bg_light, style = "bold" }),
		TelescopePreviewNormal({ bg = p.bg, fg = p.fg }),
		TelescopePreviewBorder({ fg = p.border, bg = p.bg }),
		TelescopePreviewTitle({ fg = p.orange, bg = p.bg, style = "bold" }),
		TelescopeSelection({ bg = p.bg_visual, fg = p.fg }),
		TelescopeSelectionCaret({ fg = p.orange, bg = p.bg_visual }),
		TelescopeMultiSelection({ bg = p.bg_darker, fg = p.fg }),
		TelescopeMatching({ fg = p.yellow, style = "bold" }),

		-- nvim-cmp
		CmpItemAbbr({ fg = p.fg }),
		CmpItemAbbrDeprecated({ fg = p.fg_dark, style = "strikethrough" }),
		CmpItemAbbrMatch({ fg = p.yellow, style = "bold" }),
		CmpItemAbbrMatchFuzzy({ fg = p.yellow, style = "bold" }),
		CmpItemKind({ fg = p.purple }),
		CmpItemKindText({ fg = p.fg }),
		CmpItemKindMethod({ fg = p.yellow }),
		CmpItemKindFunction({ fg = p.yellow }),
		CmpItemKindConstructor({ fg = p.yellow }),
		CmpItemKindField({ fg = p.purple }),
		CmpItemKindVariable({ fg = p.fg }),
		CmpItemKindClass({ fg = p.fg }),
		CmpItemKindInterface({ fg = p.fg }),
		CmpItemKindModule({ fg = p.fg }),
		CmpItemKindProperty({ fg = p.purple }),
		CmpItemKindUnit({ fg = p.cyan }),
		CmpItemKindValue({ fg = p.cyan }),
		CmpItemKindEnum({ fg = p.fg }),
		CmpItemKindKeyword({ fg = p.orange }),
		CmpItemKindSnippet({ fg = p.green_bright }),
		CmpItemKindColor({ fg = p.purple }),
		CmpItemKindFile({ fg = p.cyan }),
		CmpItemKindReference({ fg = p.cyan }),
		CmpItemKindFolder({ fg = p.cyan }),
		CmpItemKindEnumMember({ fg = p.purple }),
		CmpItemKindConstant({ fg = p.purple }),
		CmpItemKindStruct({ fg = p.fg }),
		CmpItemKindEvent({ fg = p.purple }),
		CmpItemKindOperator({ fg = p.fg }),
		CmpItemKindTypeParameter({ fg = p.fg }),
		CmpItemMenu({ fg = p.fg_comment }),

		-- GitSigns
		GitSignsAdd({ fg = p.hint }),
		GitSignsAddNr({ fg = p.hint }),
		GitSignsAddLn({ bg = p.diff_add }),
		GitSignsChange({ fg = p.warning }),
		GitSignsChangeNr({ fg = p.warning }),
		GitSignsChangeLn({ bg = p.diff_change }),
		GitSignsDelete({ fg = p.error }),
		GitSignsDeleteNr({ fg = p.error }),
		GitSignsDeleteLn({ bg = p.diff_delete }),
		GitSignsCurrentLineBlame({ fg = p.fg_comment }),

		-- Diff
		DiffAdd({ bg = p.diff_add }),
		DiffChange({ bg = p.diff_change }),
		DiffDelete({ bg = p.diff_delete, fg = p.diff_text }),
		DiffText({ bg = p.warning_bg, fg = p.warning }),

		-- Neogit
		NeogitBranch({ fg = p.purple }),
		NeogitRemote({ fg = p.cyan }),
		NeogitHunkHeader({ bg = p.bg_light, fg = p.fg }),
		NeogitHunkHeaderHighlight({ bg = p.bg_visual, fg = p.orange }),
		NeogitDiffContextHighlight({ bg = p.bg_current_line }),
		NeogitDiffDeleteHighlight({ bg = p.diff_delete, fg = p.diff_text }),
		NeogitDiffAddHighlight({ bg = p.diff_add }),

		-- vim-fugitive
		fugitiveHeader({ fg = p.orange, style = "bold" }),
		fugitiveUntrackedModifier({ fg = p.error }),
		fugitiveUnstagedModifier({ fg = p.warning }),
		fugitiveStagedModifier({ fg = p.hint }),

		-- indent-blankline
		IndentBlanklineChar({ fg = p.bg_gutter }),
		IndentBlanklineContextChar({ fg = p.gray }),
		IndentBlanklineContextStart({ sp = p.gray, style = "underline" }),
		IndentBlanklineSpaceChar({ fg = p.bg_gutter }),
		IndentBlanklineSpaceCharBlankline({ fg = p.bg_gutter }),

		-- nvim-notify
		NotifyERRORBorder({ fg = p.error }),
		NotifyERRORIcon({ fg = p.error }),
		NotifyERRORTitle({ fg = p.error }),
		NotifyWARNBorder({ fg = p.warning }),
		NotifyWARNIcon({ fg = p.warning }),
		NotifyWARNTitle({ fg = p.warning }),
		NotifyINFOBorder({ fg = p.info }),
		NotifyINFOIcon({ fg = p.info }),
		NotifyINFOTitle({ fg = p.info }),
		NotifyDEBUGBorder({ fg = p.fg_comment }),
		NotifyDEBUGIcon({ fg = p.fg_comment }),
		NotifyDEBUGTitle({ fg = p.fg_comment }),
		NotifyTRACEBorder({ fg = p.purple }),
		NotifyTRACEIcon({ fg = p.purple }),
		NotifyTRACETitle({ fg = p.purple }),

		-- nvim-dap (debugging)
		DapBreakpoint({ fg = p.error }),
		DapBreakpointCondition({ fg = p.warning }),
		DapBreakpointRejected({ fg = p.fg_dark }),
		DapLogPoint({ fg = p.info }),
		DapStopped({ bg = p.bg_visual, fg = p.yellow }),

		-- nvim-dap-ui
		DapUIVariable({ fg = p.fg }),
		DapUIValue({ fg = p.cyan }),
		DapUIFrameName({ fg = p.yellow }),
		DapUIThread({ fg = p.hint }),
		DapUIWatchesValue({ fg = p.cyan }),
		DapUIBreakpointsInfo({ fg = p.info }),
		DapUIBreakpointsPath({ fg = p.cyan }),
		DapUIBreakpointsCurrentLine({ fg = p.yellow, style = "bold" }),
		DapUIStoppedThread({ fg = p.hint }),

		-- lualine support (for custom themes)
		LualineNormal({ bg = p.bg_light, fg = p.fg }),
		LualineInsert({ bg = p.hint, fg = p.bg }),
		LualineVisual({ bg = p.bg_visual, fg = p.fg }),
		LualineReplace({ bg = p.error, fg = p.bg }),
		LualineCommand({ bg = p.orange, fg = p.bg }),
		LualineInactive({ bg = p.bg_gutter, fg = p.fg_dark }),

		-- which-key
		WhichKey({ fg = p.orange, style = "bold" }),
		WhichKeyGroup({ fg = p.purple }),
		WhichKeyDesc({ fg = p.fg }),
		WhichKeySeperator({ fg = p.fg_comment }),
		WhichKeySeparator({ fg = p.fg_comment }),
		WhichKeyFloat({ bg = p.bg_light }),
		WhichKeyValue({ fg = p.cyan }),

		-- dashboard-nvim
		DashboardHeader({ fg = p.orange }),
		DashboardCenter({ fg = p.purple }),
		DashboardFooter({ fg = p.fg_comment, style = "italic" }),
		DashboardKey({ fg = p.orange, style = "bold" }),
		DashboardDesc({ fg = p.fg }),
		DashboardIcon({ fg = p.cyan }),

		-- alpha-nvim
		AlphaHeader({ fg = p.orange }),
		AlphaButtons({ fg = p.purple }),
		AlphaShortcut({ fg = p.orange, style = "bold" }),
		AlphaFooter({ fg = p.fg_comment, style = "italic" }),

		-- neo-tree
		NeoTreeNormal({ bg = p.bg, fg = p.fg }),
		NeoTreeNormalNC({ bg = p.bg, fg = p.fg }),
		NeoTreeVertSplit({ fg = p.border_dark, bg = p.bg }),
		NeoTreeWinSeparator({ fg = p.border_dark, bg = p.bg }),
		NeoTreeEndOfBuffer({ fg = p.bg }),
		NeoTreeRootName({ fg = p.orange, style = "bold" }),
		NeoTreeFileName({ fg = p.fg }),
		NeoTreeFileIcon({ fg = p.fg }),
		NeoTreeFileNameOpened({ fg = p.cyan, style = "bold" }),
		NeoTreeIndentMarker({ fg = p.fg_dark }),
		NeoTreeGitAdded({ fg = p.hint }),
		NeoTreeGitConflict({ fg = p.error }),
		NeoTreeGitModified({ fg = p.warning }),
		NeoTreeGitUntracked({ fg = p.fg_comment }),
		NeoTreeTitleBar({ bg = p.bg_light, fg = p.orange, style = "bold" }),
		NeoTreeFloatBorder({ fg = p.border }),
		NeoTreeFloatTitle({ fg = p.orange, style = "bold" }),
		NeoTreeTabActive({ bg = p.bg, fg = p.orange, style = "bold" }),
		NeoTreeTabInactive({ bg = p.bg_gutter, fg = p.fg_dark }),
		NeoTreeTabSeparatorActive({ fg = p.border, bg = p.bg }),
		NeoTreeTabSeparatorInactive({ fg = p.border_dark, bg = p.bg_gutter }),

		-- bufferline.nvim
		BufferLineIndicatorSelected({ fg = p.orange }),
		BufferLineFill({ bg = p.bg_darker }),
		BufferLineBufferSelected({ fg = p.fg, style = "bold" }),
		BufferLineBackground({ bg = p.bg_gutter, fg = p.fg_dark }),

		-- leap.nvim
		LeapMatch({ bg = p.bg_visual, fg = p.yellow, style = "bold" }),
		LeapLabelPrimary({ bg = p.orange, fg = p.bg, style = "bold" }),
		LeapLabelSecondary({ bg = p.cyan, fg = p.bg, style = "bold" }),
		LeapBackdrop({ fg = p.fg_dark }),

		-- hop.nvim
		HopNextKey({ fg = p.orange, style = "bold" }),
		HopNextKey1({ fg = p.cyan, style = "bold" }),
		HopNextKey2({ fg = p.purple }),
		HopUnmatched({ fg = p.fg_dark }),
		HopCursor({ bg = p.orange, fg = p.bg }),
		HopPreview({ bg = p.bg_visual, fg = p.yellow }),

		-- nvim-treesitter-context
		TreesitterContext({ bg = p.bg_darker }),
		TreesitterContextLineNumber({ bg = p.bg_darker, fg = p.yellow }),
		TreesitterContextBottom({ style = "underline", sp = p.border_dark }),

		-- nvim-scrollbar
		ScrollbarHandle({ bg = p.bg_light }),
		ScrollbarSearchHandle({ bg = p.bg_visual, fg = p.yellow }),
		ScrollbarSearch({ fg = p.yellow }),
		ScrollbarErrorHandle({ bg = p.bg_light, fg = p.error }),
		ScrollbarError({ fg = p.error }),
		ScrollbarWarnHandle({ bg = p.bg_light, fg = p.warning }),
		ScrollbarWarn({ fg = p.warning }),
		ScrollbarInfoHandle({ bg = p.bg_light, fg = p.info }),
		ScrollbarInfo({ fg = p.info }),
		ScrollbarHintHandle({ bg = p.bg_light, fg = p.hint }),
		ScrollbarHint({ fg = p.hint }),
		ScrollbarMiscHandle({ bg = p.bg_light, fg = p.purple }),
		ScrollbarMisc({ fg = p.purple }),

		-- trouble.nvim
		TroubleText({ fg = p.fg }),
		TroubleCount({ bg = p.bg_visual, fg = p.yellow, style = "bold" }),
		TroubleNormal({ bg = p.bg, fg = p.fg }),
		TroubleSignError({ fg = p.error }),
		TroubleSignWarning({ fg = p.warning }),
		TroubleSignInformation({ fg = p.info }),
		TroubleSignHint({ fg = p.hint }),
		TroubleSignOther({ fg = p.purple }),
		TroubleFoldIcon({ fg = p.orange }),
		TroubleIndent({ fg = p.fg_dark }),
		TroubleLocation({ fg = p.fg_comment }),

		-- mason.nvim
		MasonNormal({ bg = p.bg_light, fg = p.fg }),
		MasonHeader({ bg = p.orange, fg = p.bg, style = "bold" }),
		MasonHeaderSecondary({ bg = p.cyan, fg = p.bg, style = "bold" }),
		MasonHighlight({ fg = p.cyan }),
		MasonHighlightBlock({ bg = p.bg_visual, fg = p.cyan }),
		MasonHighlightBlockBold({ bg = p.bg_visual, fg = p.cyan, style = "bold" }),
		MasonHighlightSecondary({ fg = p.yellow }),
		MasonHighlightBlockSecondary({ bg = p.bg_visual, fg = p.yellow }),
		MasonHighlightBlockBoldSecondary({ bg = p.bg_visual, fg = p.yellow, style = "bold" }),
		MasonMuted({ fg = p.fg_comment }),
		MasonMutedBlock({ bg = p.bg_darker, fg = p.fg_comment }),
		MasonMutedBlockBold({ bg = p.bg_darker, fg = p.fg_comment, style = "bold" }),

		-- noice.nvim
		NoiceNormal({ bg = p.bg_light, fg = p.fg }),
		NoiceBorder({ fg = p.border, bg = p.bg_light }),
		NoiceCmdlinePopupBorder({ fg = p.border }),
		NoiceCmdlineIcon({ fg = p.orange }),
		NoiceConfirmBorder({ fg = p.border }),
		NoiceFormatTitle({ fg = p.orange, style = "bold" }),

		-- nvim-navic
		NavicIconsFile({ fg = p.fg }),
		NavicIconsModule({ fg = p.fg }),
		NavicIconsNamespace({ fg = p.fg }),
		NavicIconsPackage({ fg = p.fg }),
		NavicIconsClass({ fg = p.fg }),
		NavicIconsMethod({ fg = p.yellow }),
		NavicIconsProperty({ fg = p.purple }),
		NavicIconsField({ fg = p.purple }),
		NavicIconsConstructor({ fg = p.yellow }),
		NavicIconsEnum({ fg = p.fg }),
		NavicIconsInterface({ fg = p.fg }),
		NavicIconsFunction({ fg = p.yellow }),
		NavicIconsVariable({ fg = p.fg }),
		NavicIconsConstant({ fg = p.purple }),
		NavicIconsString({ fg = p.green_bright }),
		NavicIconsNumber({ fg = p.cyan }),
		NavicIconsBoolean({ fg = p.orange }),
		NavicIconsArray({ fg = p.fg }),
		NavicIconsObject({ fg = p.fg }),
		NavicIconsKey({ fg = p.purple }),
		NavicIconsNull({ fg = p.orange }),
		NavicIconsEnumMember({ fg = p.purple }),
		NavicIconsStruct({ fg = p.fg }),
		NavicIconsEvent({ fg = p.purple }),
		NavicIconsOperator({ fg = p.fg }),
		NavicIconsTypeParameter({ fg = p.fg }),
		NavicText({ fg = p.fg }),
		NavicSeparator({ fg = p.fg_comment }),

		-- symbols-outline.nvim
		FocusedSymbol({ bg = p.bg_visual, fg = p.yellow, style = "bold" }),
		SymbolsOutlineConnector({ fg = p.fg_dark }),

		-- aerial.nvim
		AerialNormal({ bg = p.bg, fg = p.fg }),
		AerialBorder({ fg = p.border }),
		AerialLine({ bg = p.bg_visual }),
		AerialLineNC({ bg = p.bg_current_line }),

		-- nvim-ufo (folding)
		UfoFoldedBg({ bg = p.bg_darker }),
		UfoFoldedFg({ fg = p.fg }),
		UfoCursorFoldedLine({ bg = p.bg_current_line, style = "bold" }),
		UfoPreviewSbar({ bg = p.bg_gutter }),
		UfoPreviewThumb({ bg = p.fg_dark }),
		UfoPreviewWinBar({ bg = p.bg, fg = p.fg }),
		UfoFoldedEllipsis({ fg = p.fg_comment }),

		-- headlines.nvim (markdown)
		Headline1({ bg = hsl("#3C2E26") }),
		Headline2({ bg = hsl("#36302C") }),
		Headline3({ bg = hsl("#303231") }),
		Headline4({ bg = hsl("#2A3135") }),
		Headline5({ bg = hsl("#2D2E3A") }),
		Headline6({ bg = hsl("#312D39") }),
		CodeBlock({ bg = p.bg_darker }),
		Dash({ fg = p.orange, style = "bold" }),
	}
end)
