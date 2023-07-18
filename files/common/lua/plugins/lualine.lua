require('lualine').setup {
  options = {
    icons_enabled = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  }
}
