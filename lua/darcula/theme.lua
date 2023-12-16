
local c = require('darcula.palette')

local hl = vim.api.nvim_set_hl
local theme = {}

theme.set_highlights = function()

  -- highlights
  hl(0, "Normal", { fg = c.fg, bg = c.bg })
  hl(0, "Type", { fg = c.white, bg = 'NONE' })
  hl(0, "Character", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "Comment", { fg = c.comment, bg = 'NONE' })
  hl(0, "Identifier", { fg = c.purple, bg = 'NONE' })
  hl(0, "Include", { fg = c.orange, bg = 'NONE' })

  -- Treesitter
  hl(0, "TSString", { fg = c.green, bg = 'NONE' })
  hl(0, "TSPreProc", { fg = c.orange, bg = 'NONE' })
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

  -- Language
  hl(0, "htmlTag", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "htmlArg", { fg = c.html_css_white, bg = 'NONE' })
  hl(0, "htmlComment", { fg = c.comment, bg = 'NONE' })
  hl(0, "htmlLink", { fg = c.html_css_green, bg = 'NONE', underline=true, })
  hl(0, "htmlString", { fg = c.html_css_green, bg = 'NONE' })
  hl(0, "sassClass", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "sassAmpersand", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssBraces", { fg = c.html_css_white, bg = 'NONE' })
  hl(0, "cssInclude", { fg = c.orange, bg = 'NONE' })
  hl(0, "cssTagName", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssClassName", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssPseudoClass", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssPseudoClassId", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssPseudoClassLang", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssIdentifier", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssAttr", { fg = c.html_css_green, bg = 'NONE' })
  hl(0, "cssAttrRegion", { fg = c.html_css_green, bg = 'NONE' })
  hl(0, "cssFunction", { fg = c.orange, bg = 'NONE' })
  hl(0, "cssFunctionName", { fg = c.html_css_yellow, bg = 'NONE' })
  hl(0, "cssValueNumber", { fg = c.blue, bg = 'NONE' })
  hl(0, "cssValueLength", { fg = c.blue, bg = 'NONE' })
  hl(0, "cssUnitDecorators", { fg = c.html_css_green, bg = 'NONE' })
  hl(0, "cssImportant", { fg = c.orange, bg = 'NONE' })
  hl(0, "cssColor", { fg = c.blue, bg = 'NONE' })
  hl(0, "jsonKeyword", { fg = c.purple, bg = 'NONE' })
  hl(0, "yamlBlockMappingKey", { fg = c.orange, bg = 'NONE' })
  hl(0, "tomlTSProperty", { fg = c.orange, bg = 'NONE' })
end

return theme