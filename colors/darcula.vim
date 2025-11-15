set background=dark
let g:colors_name="darcula"

lua package.loaded['lush_theme.darcula'] = nil

lua require('lush')(require('lush_theme.darcula'))
