-- darcula-solid.nvim
-- A Neovim theme inspired by the JetBrains Darcula theme.
-- Author: brianpooe
-- License: MIT

local lush = require("lush")
local hsl = lush.hsl

-- The official Darcula color palette
-- Sourced from JetBrains IDEs and community documentation.
local p = {
	-- Base Colors
	bg = hsl("#2B2B2B"), -- Editor background
	bg_light = hsl("#3C3F41"), -- UI elements like statusline, popups
	bg_gutter = hsl("#313335"), -- Gutter background
	bg_visual = hsl("#214283"), -- Visual selection background
	fg = hsl("#A9B7C6"), -- Default foreground
	fg_dark = hsl("#606366"), -- Gutter numbers, inactive elements
	fg_comment = hsl("#808080"), -- Comments

	-- Syntax Colors
	orange = hsl("#CC7832"), -- Keywords (if, else, for), statements
	yellow = hsl("#FFC66D"), -- Functions, methods, classes
	green = hsl("#6A8759"), -- Strings
	purple = hsl("#9876AA"), -- Variables, constants
	cyan = hsl("#6897BB"), -- Numbers
	pink = hsl("#CB77B4"), -- Tags, annotations
	white = hsl("#FFFFFF"),

	-- Diagnostic Colors
	error = hsl("#FF6B68"),
	warning = hsl("#FDA44E"),
	info = hsl("#82AAD9"),
	hint = hsl("#57B6B6"),
}

-- The theme definition using lush.nvim
return lush(function()
	return {

		-- == Neovim UI Groups == --
		Normal({ bg = p.bg, fg = p.fg }),
		NormalNC({ bg = p.bg, fg = p.fg }), -- Non-current windows
		SignColumn({ bg = p.bg, fg = p.fg_dark }),
		LineNr({ bg = p.bg, fg = p.fg_dark }),
		CursorLineNr({ bg = p.bg, fg = p.yellow, style = "bold" }),
		CursorLine({ bg = p.bg_light }),
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

		VertSplit({ fg = p.bg_gutter, bg = p.bg }),
		WinSeparator({ fg = p.bg_gutter, bg = p.bg }),

		Search({ bg = hsl("#474131"), fg = p.yellow }),
		IncSearch({ bg = hsl("#474131"), fg = p.yellow }),
		CurSearch({ link = "IncSearch" }),

		Title({ fg = p.orange, style = "bold" }),
		Directory({ fg = p.cyan }),
		ErrorMsg({ fg = p.error }),
		MoreMsg({ fg = p.green }),
		Question({ fg = p.cyan }),
		ModeMsg({ fg = p.fg, style = "bold" }),
		Conceal({ fg = p.fg_dark, bg = p.bg }),
		Folded({ fg = p.fg_comment, bg = p.bg_light }),

		-- == Standard Syntax Groups (Fallback for no Tree-sitter) == --
		Comment({ fg = p.fg_comment, style = "italic" }),
		String({ fg = p.green }),
		Number({ fg = p.cyan }),
		Constant({ fg = p.purple }),
		Character({ fg = p.purple }),
		Boolean({ fg = p.orange }),

		Keyword({ fg = p.orange, style = "bold" }),
		Statement({ fg = p.orange, style = "bold" }),
		Operator({ fg = p.fg }),
		Conditional({ fg = p.orange, style = "bold" }),
		Repeat({ fg = p.orange, style = "bold" }),

		Identifier({ fg = p.fg }),
		Function({ fg = p.yellow }),
		Type({ fg = p.yellow, style = "italic" }),
		PreProc({ fg = p.orange }),

		Special({ fg = p.pink }),
		Todo({ bg = p.bg_light, fg = p.purple, style = "bold" }),
		Underlined({ style = "underline" }),

		-- == Tree-sitter Highlight Groups == --
		["@comment"] = { link = "Comment" },
		["@string"] = { link = "String" },
		["@string.regex"] = { fg = p.pink },
		["@string.escape"] = { fg = p.pink },
		["@character"] = { link = "Character" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@float"] = { link = "Number" },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = p.yellow, style = "italic" },
		["@function.call"] = { link = "Function" },
		["@function.macro"] = { fg = p.pink },

		["@method"] = { link = "Function" },
		["@method.call"] = { link = "Function" },

		["@constructor"] = { fg = p.yellow },
		["@parameter"] = { fg = p.fg, style = "italic" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.operator"] = { link = "Keyword" },
		["@keyword.return"] = { link = "Keyword" },

		["@conditional"] = { link = "Conditional" },
		["@repeat"] = { link = "Repeat" },
		["@label"] = { fg = p.pink },
		["@operator"] = { link = "Operator" },
		["@exception"] = { fg = p.orange, style = "bold" },

		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = p.yellow, style = "italic,bold" },
		["@type.definition"] = { fg = p.fg },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = p.purple, style = "italic" },
		["@constant.macro"] = { link = "Constant" },

		["@variable"] = { fg = p.purple },
		["@variable.builtin"] = { fg = p.purple, style = "italic,bold" },
		["@property"] = { fg = p.fg },

		["@include"] = { link = "PreProc" },
		["@namespace"] = { fg = p.yellow },

		["@punctuation.delimiter"] = { fg = p.fg },
		["@punctuation.bracket"] = { fg = p.fg },
		["@punctuation.special"] = { link = "Special" },

		["@tag"] = { fg = p.orange },
		["@tag.attribute"] = { fg = p.purple, style = "italic" },
		["@tag.delimiter"] = { fg = p.fg_dark },

		["@text"] = { fg = p.fg },
		["@text.strong"] = { style = "bold" },
		["@text.emphasis"] = { style = "italic" },
		["@text.underline"] = { style = "underline" },
		["@text.strike"] = { style = "strikethrough" },
		["@text.title"] = { link = "Title" },
		["@text.literal"] = { fg = p.green },
		["@text.uri"] = { fg = p.cyan, style = "underline" },

		-- == LSP Diagnostics == --
		DiagnosticError({ fg = p.error }),
		DiagnosticWarn({ fg = p.warning }),
		DiagnosticInfo({ fg = p.info }),
		DiagnosticHint({ fg = p.hint }),
		LspDiagnosticsDefaultError({ link = "DiagnosticError" }),
		LspDiagnosticsDefaultWarning({ link = "DiagnosticWarn" }),
		LspDiagnosticsDefaultInformation({ link = "DiagnosticInfo" }),
		LspDiagnosticsDefaultHint({ link = "DiagnosticHint" }),

		-- == Plugin Support == --
		-- NvimTree
		NvimTreeNormal({ bg = p.bg, fg = p.fg }),
		NvimTreeVertSplit({ fg = p.bg_gutter, bg = p.bg }),
		NvimTreeEndOfBuffer({ fg = p.bg }),
		NvimTreeFolderIcon({ fg = p.cyan }),

		-- Telescope
		TelescopeNormal({ bg = p.bg_light }),
		TelescopeBorder({ fg = p.bg_gutter, bg = p.bg_light }),
		TelescopePromptBorder({ fg = p.bg_gutter, bg = p.bg_light }),
		TelescopeResultsBorder({ fg = p.bg_gutter, bg = p.bg_light }),
		TelescopePreviewBorder({ fg = p.bg_gutter, bg = p.bg_light }),
		TelescopeSelection({ bg = p.bg_visual }),

		-- GitSigns
		GitSignsAdd({ fg = p.green }),
		GitSignsChange({ fg = p.cyan }),
		GitSignsDelete({ fg = p.error }),

		-- Neogit
		NeogitBranch({ fg = p.purple }),
		NeogitRemote({ fg = p.cyan }),
	}
end)
