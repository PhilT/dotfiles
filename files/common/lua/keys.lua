-- Setup
map('n', '<C-z>', '<Nop>')                                                      -- Turn off stupid CTRL keys
map('n', '<C-s>', '<Nop>')                                                      -- Turn off stupid CTRL keys
map('n', '<C-q>', '<Nop>')                                                      -- Turn off stupid CTRL keys
map('n', '<Space>', '<Nop>')                                                    -- Unmap spacebar
vim.g.mapleader = ' '                                                           -- Make spacebar the leader key
vim.g.localleader = ' '

-- Movement keys
map('t', '<A-e>', '<C-\\><C-n>')                                                -- ALT+e switches to NORMAL mode from TERMINAL mode
map('t', '<A-h>', '<C-\\><C-n><C-w>h')                                          --
map('t', '<A-j>', '<C-\\><C-n><C-w>j')                                          -- ALT+(hjkl) to navigate splits from terminal mode...
map('t', '<A-k>', '<C-\\><C-n><C-w>k')                                          --
map('t', '<A-l>', '<C-\\><C-n><C-w>l')                                          --
map('i', '<A-h>', '<C-\\><C-n><C-w>h')                                          -- ...insert mode
map('i', '<A-j>', '<C-\\><C-n><C-w>j')                                          --
map('i', '<A-k>', '<C-\\><C-n><C-w>k')                                          --
map('i', '<A-l>', '<C-\\><C-n><C-w>l')                                          --
map('n', '<A-h>', '<C-w>h')                                                     -- ...normal mode
map('n', '<A-j>', '<C-w>j')                                                     --
map('n', '<A-k>', '<C-w>k')                                                     --
map('n', '<A-l>', '<C-w>l')                                                     --
map('n', '<C-h>', '<C-w>h')                                                     -- CTRL+(hjkl) to navigate splits from NORMAL mode
map('n', '<C-j>', '<C-w>j')                                                     --
map('n', '<C-k>', '<C-w>k')                                                     --
map('n', '<C-l>', '<C-w>l')                                                     --
map('n', '<C-c>', '<C-w>c')                                                     -- 'CTRL+c' to close window

-- Neovim
local init_lua_path = os.getenv('CODE_DIR')..'/dotfiles/files/common/init.lua'
map('n', '<Leader>a', '<cmd>source '..init_lua_path..'<CR>')                    -- Reload config

-- Toggles
map('n', '<Leader>i', '<cmd>setlocal number!<CR>')                              -- Toggle line numbers
map('n', '<Leader>o', '<cmd>set paste!<CR>')                                    -- Toggle paste formatting
map('n', '<Leader>-', '<cmd>nohlsearch<CR>')                                    -- SPACE+- to turn off search highlight
map('n', '<C-p>', '<cmd>Files<CR>')                                             -- CTRL+p to open Fuzzy finder
map('n', '<C-f>', '<cmd>NERDTreeToggle<CR>')                                    -- CTRL+f to open NERDTree
map('n', '<C-b>', '<cmd>Buffers<CR>')                                           -- CTRL+b to open buffer list - currently open files

-- Session
map('n', '<C-x>', '<cmd>wa<CR><cmd>mksession!<CR><cmd>qa<CR>')                  -- CTRL+x to save all buffers, save session and exit vim

-- Scratch
map('n', 'go', '<cmd>Scratch<CR>')                                              -- go to switch to Scratch window for making notes
map('n', 'gp', '<cmd>ScratchPreview<CR>')                                       -- gp to open Scratch window without switching to it

-- Windows
map('n', 'zz', '<c-w>_ \\| <c-w>\\|')                                           -- Zoom in and maximize current window
map('n', 'zo', '<c-w>=')                                                        -- Zoom out and equalize windows

-- Tabs
map('n', 'ta', '<cmd>tabe<CR>')                                                 -- Add tab pane
map('n', 'tc', '<cmd>tabc<CR>')                                                 -- Clear (remove) tab pane
map('n', 'tt', '<cmd>tabe<CR><cmd>term<CR>')                                    -- Open terminal in new tab

-- Quickfix
map('n', '<CR>', '<cmd>cn<CR>')                                                 -- Next quickfix entry
map('n', '<Leader><CR>', '<cmd>cp<CR>')                                         -- Previous quickfix entry
map('n', '<Leader>c', '<cmd>ccl<CR>')                                           -- Close quickfix window

-- NERDTree
map('n', '<Leader>f', '<cmd>NERDTreeFind<CR>')                                  -- Find and reveal the current file in NERDTree
