require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous
      }
    },
    layout_config = {
      width = 0.5,
      mirror = true,
      prompt_position = 'top',
      preview_width = 0.498
    }
  }
})

function calc_telescope_layout()
  local width = vim.go.columns
  if width > 350 then
    return {
      width = 0.5,
      mirror = true
    }
  elseif width > 280 then
    return {
      width = 0.7,
      mirror = false
    }
  else
    return {
      width = 0.9,
      mirror = false
    }
  end
end
