require("nvim-tree").setup {
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = 'win',
        width = 60,
        col = 10
      }
    }
  },
  renderer = {
    icons = {
      show = {
        git = false
      }
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false
      }
    }
  },
  live_filter = {
    always_show_folders = false
  }
}