local cmd = vim.cmd                                                             -- Shortcuts
local fn = vim.fn
local g = vim.g

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}                              -- Workaround to enable simple option interface until 
local function opt(scope, key, value)                                           -- https://github.com/neovim/neovim/pull/13479 is complete
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- Plugins ----------------------------------------------------------------------------------------------------------------------------------------------------


g.polyglot_disabled = {'fsharp'}

cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

paq {'savq/paq-nvim', opt = true}                                               -- manages itself
paq {'SirVer/ultisnips'}                                                        -- Handle snippets
paq {'PhilT/vim-fs'}                                                            -- F# Syntax and Indent
paq {'neovim/nvim-lspconfig'}                                                   -- Language server client settings
paq {'nvim-lua/completion-nvim'}                                                -- Useful defaults to make completion work
paq {'jiangmiao/auto-pairs'}                                                    -- ALT-n - Next bracket pair - Auto-pair brackets.
paq {'junegunn/vader.vim'}                                                      -- Vimscript test framework
paq {'junegunn/fzf'}                                                            -- Fuzzy finder
paq {'junegunn/fzf.vim'}
paq {'jacoborus/tender.vim'}                                                    -- Colorscheme
paq {'editorconfig/editorconfig-vim'}                                           -- Use a project's .editorconfig file for formatting
paq {'tpope/vim-fugitive'}                                                      -- Git plugin - :G for enhanced status. See plugin section below for more
paq {'itchyny/lightline.vim'}                                                   -- Simple statusline
paq {'scrooloose/nerdtree'}                                                     -- CTRL+B - open file tree
paq {'tpope/vim-repeat'}                                                        -- Repeat plugin commands such as surround with `.`
paq {'mtth/scratch.vim'}                                                        -- go/gp - Scratchpad
paq {'mhinz/vim-signify'}                                                       -- Git icons in the gutter
paq {'tpope/vim-surround'}                                                      -- cs'<q> - change from single quotes to xml tags
paq {'tpope/vim-scriptease'}                                                    -- Some helpers for developing Vim plugins
paq {'dbeniamine/todo.txt-vim'}                                                 -- \do - Opens C:\Users\phil\Dropbox\todo\todo.txt
paq {'mbbill/undotree'}                                                         -- :UndotreeToggle/F5 - Visualise the undo tree
paq {'godlygeek/tabular'}                                                       -- For aligning text (like this comment!)
paq {'plasticboy/vim-markdown'}                                                 -- Markdown syntax highlighting and commands like adding a TOC
paq {'OmniSharp/omnisharp-vim'}                                                 -- C# plugin
paq {'nvim-treesitter/nvim-treesitter'}                                         -- More accurate syntax highlighting for some languages (e.g. Ruby)
paq {'slim-template/vim-slim'}                                                  -- Slim templates syntax highlighting
paq {'tpope/vim-abolish'}                                                       -- Change word styles (e.g. Camelcase to underscore)

--[[
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Temporary settings for testing - move once confirmed working

-- Configure RipGrep to also search hidden files (.likethis)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --ignore-file ~/.ignore --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc|hi! link pandocStrong Operator|hi! link pandocEmphasis Delimiter
augroup END
--]]

-- General settings -------------------------------------------------------------------------------------------------------------------------------------------

local indent = 2

vim.o.switchbuf = 'useopen'                                                     -- `:sbuf filepattern` switch to buffer and use available window if visible
vim.o.cmdheight = 2                                                             -- Doesn't halt nvim for 2 line messages
vim.o.completeopt = 'menuone,noinsert,noselect'                                 -- popup on 1 item, don't auto-insert selection, don't auto-select a match

opt('b', 'expandtab', true)                                                     -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                                                  -- Size of an indent
opt('b', 'smartindent', true)                                                   -- Insert indents automatically
opt('b', 'softtabstop', indent)                                                 -- Default tab size for when there is no .editorconfig
opt('b', 'tabstop', indent)                                                     -- Default tab size for when there is no .editorconfig
opt('b', 'fileformat', 'unix')                                                  -- Ensure lf line-endings are used on Windows
opt('b', 'swapfile', false)                                                     -- Don't create temporary swap files

opt('o', 'backup', false)                                                       -- Don't create backups
opt('o', 'equalalways', false)                                                  -- Stop windows being resized (to stop todo.txt from being resized)
opt('o', 'fileformats', 'unix,dos')                                             -- Recognise unix or dos line-endings, save new files as unix
opt('o', 'hidden', true)                                                        -- hide buffers instead of closing
opt('o', 'ignorecase', true)                                                    -- See smartcase
opt('o', 'incsearch', true)                                                     -- Show matches as you type
opt('o', 'laststatus', 2)                                                       -- Always show the statusline
opt('o', 'path', vim.o.path..'**')                                              -- recursively search files
opt('o', 'scrolloff', 2)                                                        -- Page up/down with 2 extra lines showing above/below cursor position
opt('o', 'shortmess', vim.o.shortmess..'c')                                     -- Don't show extra completion status messages
opt('o', 'showmode', false)                                                     -- Turn off -- INSERT -- in statusline (lightline already shows it)
opt('o', 'smartcase', true)                                                     -- Case insensitive search when characters in pattern are lowercase
opt('o', 'splitbelow', true)                                                    -- Open new horizontal splits below the current one
opt('o', 'splitright', true)                                                    -- Open new vertical splits to the right of the current one
opt('o', 'termguicolors', true)                                                 -- True color support
opt('o', 'updatetime', 100)                                                     -- Bring down delay for diagnostic messages
opt('o', 'wildignore', vim.o.wildignore..'.git/**,tmp/**,coverage/**,log/**,db/migrate/**,node_modules/**,bin/**,**/*.min.js')
opt('o', 'wildmenu', true)                                                      -- TAB completion in COMMAND mode
opt('o', 'writebackup', false)                                                  -- Don't create backups

opt('w', 'conceallevel', 2)                                                     -- Make Markdown look pretty (hides some characters unless at the cursor)
opt('w', 'cursorline', true)                                                    -- Turn on highlight on cursor line (Uses color of CursorLine)
opt('w', 'foldenable', false)                                                   -- Turn off code folding
opt('w', 'number', true)                                                        -- line numbers
opt('w', 'signcolumn', 'yes')                                                   -- Keeps sign column visable to stop edit window shifting left and right

cmd('syntax enable')                                                            -- Ensures error pop ups correctly show red text
cmd('colorscheme tender')                                                       -- Set theme
cmd('hi! Search guifg=#333333 guibg=#c9d05c ctermbg=NONE gui=NONE cterm=NONE')  -- Remove underline from search highlight and use some inverted color instead
cmd('hi! CursorLine guibg=#333333')

local a = {}; for i=0,500 do a[i]=i+80 end                                      -- Grey out everything past 80 columns
opt('w', 'colorcolumn', table.concat(a, ','))

-- Plugin settings --------------------------------------------------------------------------------------------------------------------------------------------
local windows = package.config:sub(1,1) == '\\'

if windows then
  g.python3_host_prog = 'C:\\Python39\\python.exe'                              -- Python providers
  g.python_host_prog = 'C:\\Python27\\python.exe'                               -- Python providers
end

g.vim_markdown_folding_disabled = 1                                             -- Folding? Yuk!
g.NERDTreeQuitOnOpen = 1                                                        -- close NERDTree after opening file
g.NERDTreeShowHidden = 1                                                        -- Show hidden files
g.NERDTreeWinSize = 50                                                          -- Width of NERDTree window
g.scratch_persistence_file = '.scratch.txt'                                     -- Store scratch text in project .scratch.txt file
g.scratch_horizontal = 1                                                        -- Open scratch split horizontally
g.scratch_height = 15                                                           -- with height of 20 rows
g.lightline = { 
  colorscheme = 'tender',                                                       -- Set theme for lightline.vim
  component_function = { filename = 'FilenameForLightline' }                    -- Calls filename_for_lightline function to show full path name in statusline 
}

shellcmd = windows and 'term://pwsh -C' or 'term://'                            -- Used by terminal split mappings to use shellcmd as the terminal shell
g.diagnostic_insert_delay = 1
g.completion_enable_auto_popup = 0                                              -- LSP completion: Disable auto popup of completion
g.completion_enable_snippet = 'UltiSnips'                                       -- LSP completion: Enable UltiSnips integration


-- LSP Client -------------------------------------------------------------------------------------------------------------------------------------------------

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

if not configs.fsharp then
  configs.fsharp = {
    default_config = {
      cmd = {'$CODE_DIR/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp3.1/FSharpLanguageServer'};
      filetypes = {'fsharp'};
      root_dir = lspconfig.util.root_pattern('*.fsproj');
    };
  }
end

-- No support for autocommands until https://github.com/neovim/neovim/pull/12378
cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')      -- Show diagnostics in a popup window instead of after source code
cmd("autocmd BufEnter * lua require'completion'.on_attach()")                   -- Load completion provider

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,                                                         -- disable virtual text
  signs = true,                                                                 -- show signs
  update_in_insert = false                                                      -- delay update diagnostics
  }
)

lspconfig.fsharp.setup{}
lspconfig.tsserver.setup{}
lspconfig.solargraph.setup{}

-- Key Mappings -----------------------------------------------------------------------------------------------------------------------------------------------


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--[[
function is_space_behind()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

function run_completion_or_next_or_snippet()
  local col = vim.api.nvim_win_get_cursor(0)[2] 
  if pumvisible()
    return '\<C-n>'
  elseif IsSpaceBehind()                                                        -- Insert a Tab if there is a space behind the cursor
    return '\<Tab>'
  else
    return '\<C-x>\<C-o>'
  endif                                                                         -- behind the current position
end

function previous_completion_item()                                             -- If completion list is open go to the previous item in the list
  return pumvisible() ? '\<C-p>' : '\<S-Tab>'                                   -- otherwise send SHIFT+TAB
end
--]]

g.UltiSnipsExpandTrigger = '<C-Tab>'
map('i', '<Tab>', '<Plug>(completion_smart_tab)', { noremap = false })          -- Potentially open completion list by pressing TAB
map('i', '<S-Tab>', '<Plug>(completion_smart_s_tab)', { noremap = false })      -- Go to previous item in completion list if open
map('n', '<Space>', '<cmd>nohlsearch<CR>')                                      -- SPACE to turn off search highlight
map('n', '<C-p>', '<cmd>Files<CR>')                                             -- CTRL+p to open Fuzzy File Finder
map('n', '<C-f>', '<cmd>NERDTreeToggle<CR>')                                    -- CTRL+f to open NERDTree file browser
map('n', '<C-u>', '<cmd>UndotreeToggle<CR>')                                    -- Show undo tree
map('n', '<C-b>', '<cmd>Buffers<CR>')                                           -- CTRL+b to open buffer list - currently open files
map('n', '<C-d>', '<cmd>OpenDiagnostic<CR>')                                    -- CTRL+d to open diagnostics - aka errors, warnings and hints to correct
map('n', '<C-s>', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')                -- CTRL+s to open symbol list (for entire workspace)- Fuzzy find types, functions, etc

map('n', 'j', 'gj')                                                             -- Move down single lines when wrapped
map('n', 'k', 'gk')                                                             -- Move down single lines when wrapped
map('n', 'go', '<cmd>Scratch<CR>')                                              -- go to switch to Scratch window (closes when switching to another window)
map('n', 'gp', '<cmd>ScratchPreview<CR>')                                       -- gp to open Scratch window

--nnoremap <C-z> :CocCommand snippets.editSnippets<CR>|                         -- CTRL+z to edit snippets for current file type


map('n', 'zz', '<c-w>_ \\| <c-w>\\|')                                           -- Zoom in and maximize current window
map('n', 'zo', '<c-w>=')                                                        -- Zoom out and equalize windows

map('n', 'ta', '<cmd>tabe<CR>')                                                 -- Add tab pane
map('n', 'tc', '<cmd>tabc<CR>')                                                 -- Clear (remove) tab pane
map('n', 'tn', '<cmd>tabn<CR>')                                                 -- Next tab pane
map('n', 'tp', '<cmd>tabp<CR>')                                                 -- Previous tab pane
map('n', 'tt', '<cmd>tabe<CR><cmd>edit '..shellcmd..'<CR>')                     -- Open terminal in new tab

map('n', '<CR>', '<cmd>cn<CR>')                                                 -- Next quickfix entry
map('n', '<Leader><CR>', '<cmd>cp<CR>')                                         -- Previous quickfix entry

map('n', '<F6>', '<cmd>setlocal spell!<CR>')                                    -- Toggle spellcheck
map('n', '<F7>', '<cmd>call v:lua.delete_term_buffer()<CR>')                    -- Close build/test terminal split
map('n', '<F8>', "<cmd>call v:lua.term_run('build')<CR>")                       -- Runs ./build in a terminal split
map('n', '<F9>', "<cmd>call v:lua.term_run('test')<CR>")                        -- Run tests in a terminal
map('n', '<S-F9>', "<cmd>call v:lua.term_run('test', 'GRAPH')<CR>")             -- Run tests in a terminal with GRAPH directive
map('n', '<F10>', "<cmd>call v:lua.term_run('run')<CR>")                        -- Run the project
map('n', '<S-F10>', "<cmd>call v:lua.term_run('run_release')<CR>")              -- Run the project
map('n', '<Leader><F10>', "<cmd>call v:lua.term_run('bench')<CR>")              -- Run BenchmarkDotNet
map('n', '<F11>', "<cmd>call v:lua.term_run('clean')<CR>")                      -- Clean the project

map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')                   -- diagnostic-nvim: Navigate diagnostics
map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')                   -- diagnostic-nvim: Navigate diagnostics
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')                         -- LSP: Goto definition
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')                         -- LSP: List references - ENTER to go to next
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')                               -- LSP: Show documentation
map('n', 'X', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')        -- LSP: Show errors in floating window (in case of long lines)
map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')                  -- LSP: Show signature (only works when opening parens)

map('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')                     -- LSP: Not supported by F# LS

map('t', '<A-e>', '<C-\\><C-n>')                                                -- ALT+e switches to NORMAL mode from TERMINAL mode
map('t', '<A-h>', '<C-\\><C-n><C-w>h')                                          --
map('t', '<A-j>', '<C-\\><C-n><C-w>j')                                          -- ALT+(hjkl) to navigate splits from any mode
map('t', '<A-k>', '<C-\\><C-n><C-w>k')                                          -- including TERMINAL mode.
map('t', '<A-l>', '<C-\\><C-n><C-w>l')                                          --
map('i', '<A-h>', '<C-\\><C-n><C-w>h')                                          -- CTRL+(hjkl) to navigate splits from NORMAL mode
map('i', '<A-j>', '<C-\\><C-n><C-w>j')                                          --
map('i', '<A-k>', '<C-\\><C-n><C-w>k')                                          --
map('i', '<A-l>', '<C-\\><C-n><C-w>l')                                          --
map('n', '<A-h>', '<C-w>h')                                                     --
map('n', '<A-j>', '<C-w>j')                                                     --
map('n', '<A-k>', '<C-w>k')                                                     --
map('n', '<A-l>', '<C-w>l')                                                     --
map('n', '<C-h>', '<C-w>h')                                                     --
map('n', '<C-j>', '<C-w>j')                                                     --
map('n', '<C-k>', '<C-w>k')                                                     --
map('n', '<C-l>', '<C-w>l')                                                     --

local init_lua_path = os.getenv('CODE_DIR')..'/dotfiles/files/config/nvim/init.lua'
local todo_path = os.getenv('TODO_DIR')..'/todo.txt'
local alacritty_yml_path = os.getenv('CODE_DIR')..'/dotfiles/files/alacritty.yml'

map('n', '<Leader>a', '<cmd>source '..init_lua_path..'<CR>')                    -- Reload Vim config
map('n', '<Leader>d', '<cmd>bd<CR>')                                            -- delete buffer
map('n', '<Leader>dd', '<cmd>bufdo bd<CR>')                                     -- delete all buffers
map('n', '<Leader>h', '<cmd>topleft vsplit '..shellcmd..'<CR>')                 -- Terminal far left split
map('n', '<Leader>i', '<cmd>setlocal number!<CR>')                              -- Toggle line numbers
map('n', '<Leader>j', '<cmd>botright split '..shellcmd..'<CR>')                 -- Terminal bottom split
map('n', '<Leader>k', '<cmd>topleft split '..shellcmd..'<CR>')                  -- Terminal top split
map('n', '<Leader>l', '<cmd>botright vsplit '..shellcmd..'<CR>')                -- Terminal far right split
map('n', '<Leader>n', '<cmd>bn<CR>')                                            -- next buffer
map('n', '<Leader>o', '<cmd>set paste!<CR>')                                    -- Toggle paste formatting
map('n', '<Leader>p', '<cmd>bp<CR>')                                            -- previous buffer

map('n', '<Leader>v', '<cmd>tabe '..init_lua_path..'<CR>')                      -- Edit vimrc
map('n', '<Leader>t', '<cmd>topleft split '..todo_path..'<CR><cmd>resize 20<CR>')-- Edit TODO list
map('n', '<Leader>y', '<cmd>tabe '..alacritty_yml_path..'<CR>')                 -- Edit alacritty.yml

-- map('n', '<C-z>', '<Nop>'                                                    -- Turn off stupid CTRL keys - Overriden by edit snippets
-- map('n', '<C-s>', '<Nop>'                                                    -- Turn off stupid CTRL keys - Overriden by symbols, above
map('n', '<C-q>', '<Nop>')                                                      -- Turn off stupid CTRL keys


-- Auto Commands ----------------------------------------------------------------------------------------------------------------------------------------------

local function au(group, commands)
  cmd('augroup '..group)
  cmd('autocmd!')
  for i, command in ipairs(commands) do
    cmd('autocmd '..command)
  end
  cmd('augroup END')
end

local commands = {
  'BufReadPost quickfix nnoremap <buffer> <CR> <CR>',                           -- Unmap ENTER in Quickfix so found files can be selected for example
  [[FileType fsharp let b:AutoPairs = AutoPairsDefine({'(*' : '*)//n'})]],      -- Define auto-pair for F# multiline comments
  'BufLeave todo.txt resize 2 | normal gg',                                     -- Resize todo window on leaving
  'BufEnter todo.txt resize 20 | set wfh',                                      -- Resize todo window on entering
  'Filetype fsharp setlocal omnifunc=v:lua.vim.lsp.omnifunc',
  'Filetype typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc',
  [[bufread *.fsx,*.fs syn region fsharpMultiLineComment start='(\*' end='\*)' contains=fsharpTodo,@Spell]] -- Spell checking in multi-line F# comments
}
au('mygroup', commands)


-- Functions --------------------------------------------------------------------------------------------------------------------------------------------------

function set_term_insert()                                                      -- Turn on insert mode
  au('TermInsert', {'TermOpen * startinsert'})
end
set_term_insert()                                                               -- Make insert mode for starting terminals the default

function _G.switch_out_of_term()                                                -- Switch back to previous window after running build command
  g.termbuffer = vim.fn.bufnr('%')                                              -- Store terminal buffer used to run build
  cmd('normal G')                                                               -- Move to bottom of output
  cmd('wincmd p')                                                               -- Switch to previous window
  set_term_insert()                                                             -- Reset back to insert mode when starting terminal window
end

function _G.term_run(command)                                                   -- Run a build command e.g. 'run', 'test', 'build'
  delete_term_buffer()

  au('TermInsert', {'TermOpen * call v:lua.switch_out_of_term()'})
  cmd('botright split '..shellcmd..' ./'..command)
end

function _G.delete_term_buffer()                                                -- Removes the terminal buffer used to run commands
  if termbuffer then
    cmd(termbuffer..'bd!')
    termbuffer = nil
  end
end

vim.api.nvim_exec(                                                              -- Show full paths in lightline.vim statusline
[[
function! FilenameForLightline()
  return expand('%')
endfunction
]], false
)

