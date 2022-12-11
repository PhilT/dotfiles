require 'paq' {
  -- Core
  'neovim/nvim-lspconfig';                                                      -- Language server client settings
  'williamboman/mason.nvim';
  'williamboman/mason-lspconfig.nvim';

  -- UI
  'EdenEast/nightfox.nvim';                                                     -- Colorscheme
  'christoomey/vim-tmux-navigator';                                             -- Move between vim and tmux panes seamlessly
  'itchyny/lightline.vim';                                                      -- Simple statusline

  -- General
  'preservim/nerdtree';
  'junegunn/fzf';                                                               -- CTRL+P to open fuzzy file finder
  'junegunn/fzf.vim';
  'mtth/scratch.vim';                                                           -- go/gp - Scratchpad
  'jiangmiao/auto-pairs';                                                       -- ALT-n - Next bracket pair - Auto-pair brackets.
  'tpope/vim-surround';                                                         -- `cs'<q>` - change from single quotes to xml tags
  'tpope/vim-repeat';                                                           -- Repeat plugin commands such as surround with `.`
  'tpope/vim-dispatch';                                                         -- Run commands asynchronously using Neovim's jobstart()
  'stefandtw/quickfix-reflector.vim';                                           -- Global search and replace: Rg to search and add reaults to quickfix then edit quickfix and save to make changes to all files
  {'dbeniamine/todo.txt-vim', url='https://gitlab.com/dbeniamine/todo.txt-vim'};-- `<Leader>t` - Opens my todo list
  'simeji/winresizer';                                                          -- `CTRL+E` - Resize windows with `hjkl`

  -- Version Control
  'tpope/vim-fugitive';                                                         -- Git plugin - :G for enhanced status. See plugin section below for more

  -- Writing
  'plasticboy/vim-markdown';                                                    -- Markdown syntax highlighting and commands like adding a TOC

  -- General programming
  'editorconfig/editorconfig-vim';                                              -- Use a project's .editorconfig file for formatting
  'tpope/vim-abolish';                                                          -- Change word styles (e.g. Camelcase to underscore)
  --'SirVer/ultisnips';                                                           -- Handle snippets
  'nvim-lua/completion-nvim';                                                   -- Useful defaults to make completion work

  -- F#
  'adelarsq/neofsharp.vim';                                                     -- F# Syntax and Indent
  --'PhilT/vim-fsharp';                                                           -- F# Syntax and Indent

  -- Vimscript
  'junegunn/vader.vim';                                                         -- Vimscript test framework
  'tpope/vim-scriptease';                                                       -- Some helpers for developing Vim plugins

  -- Ruby
  'slim-template/vim-slim';                                                     -- Slim templates syntax highlighting
}

require('mason').setup()
