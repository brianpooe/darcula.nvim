
local c = require('darcula.palette')

local hl = vim.api.nvim_set_hl
local theme = {}

theme.set_highlights = function()

  -- highlights
  hl(0, "Normal", { fg = c.fg, bg = c.bg })

  -- Treesitter
  hl(0, "TSComment", { fg = c.comment, bg = 'NONE' })
  hl(0, "TSAnnotation", { fg = c.blue, bg = 'NONE' })
  hl(0, "TSAttribute", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSConstructor", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSType", { fg = c.white, bg = 'NONE' })
  hl(0, "TSTypeBuiltin", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSConditional", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSException", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSInclude", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSKeywordReturn", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSKeyword", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSKeywordFunction", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSNamespace", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSRepeat", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSConstant", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSConstBuiltin", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSFloat", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSNumber", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSBoolean", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSCharacter", { fg = c.green, bg = 'NONE' })
  hl(0, "TSFunction", { fg = c.yellow, bg = 'NONE' })
  hl(0, "TSFuncBuiltin", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSMethod", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSConstMacro", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSFuncMacro", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSVariable", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSVariableBuiltin", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSProperty", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSField", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSParameter", { fg = c.white, bg = 'NONE' })
  hl(0, "TSParameterReference", { fg = c.white, bg = 'NONE' })
  hl(0, "TSPunctDelimiter", { fg = c.white, bg = 'NONE' })
  hl(0, "TSTagAttribute", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSPunctBracket", { fg = c.white, bg = 'NONE' })
  hl(0, "TSPunctSpecial", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSStringRegex", { fg = c.blue, bg = 'NONE' })
  hl(0, "TSStringEscape", { fg = c.green, bg = 'NONE' })
  hl(0, "TSEmphasis", { fg = 'NONE', bg = 'NONE', italic=true, })
  hl(0, "TSUnderline", { fg = 'NONE', bg = 'NONE', underline=true, })
  hl(0, "TSTitle", { fg = c.fg, bg = 'NONE',  })
  hl(0, "TSLiteral", { fg = c.orange, bg = 'NONE' })
  hl(0, "TSURI", { fg = c.orange, bg = 'NONE', underline=true, })
  hl(0, "TSKeywordOperator", { fg = c.purple, bg = 'NONE' })
  hl(0, "TSStrong", { fg = c.blue, bg = 'NONE', bold=true, })

  -- Html
  hl(0, "HtmlTag", { fg = c.yellow, bg = 'NONE' })
  hl(0, "HtmlArg", { fg = c.white, bg = 'NONE' })
  hl(0, "HtmlComment", { fg = c.comment, bg = 'NONE' })
end

return theme