---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Contents
-- --------
--
--   Plugins
--   General settings
--   Plugin settings
--   Key mappings
--   Auto commands
--   Functions
--

local cmd = vim.cmd                                                             -- Shortcuts
local fn = vim.fn
local g = vim.g

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}                              -- Workaround to enable simple option interface until 
local function opt(scope, key, value)                                           -- https://github.com/neovim/neovim/pull/13479 is complete
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plugins

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
paq {'ayu-theme/ayu-vim'}                                                       -- Color scheme with light/dark/mirage modes
paq {'editorconfig/editorconfig-vim'}                                           -- Use a project's .editorconfig file for formatting
paq {'tpope/vim-fugitive'}                                                      -- Git plugin - :G for enhanced status. See plugin section below for more
paq {'itchyny/lightline.vim'}                                                   -- Simple statusline
paq {'scrooloose/nerdtree'}                                                     -- CTRL+B - open file tree
paq {'tpope/vim-repeat'}                                                        -- Repeat plugin commands such as surround with `.`
paq {'mtth/scratch.vim'}                                                        -- go/gp - Scratchpad
paq {'mhinz/vim-signify'}                                                       -- Git icons in the gutter. vim-gitgutter doesn't seem to work
paq {'tpope/vim-surround'}                                                      -- cs'<q> - change from single quotes to xml tags
paq {'tpope/vim-scriptease'}                                                    -- Some helpers for developing Vim plugins
paq {'dbeniamine/todo.txt-vim'}                                                 -- \do - Opens C:\Users\phil\Dropbox\todo\todo.txt
paq {'mbbill/undotree'}                                                         -- :UndotreeToggle/F5 - Visualise the undo tree
paq {'vim-pandoc/vim-pandoc-syntax'}
paq {'OmniSharp/omnisharp-vim'}
paq {'nvim-treesitter/nvim-treesitter'}

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

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- General settings (sorted)
--]]

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

opt('o', 'backup', false)                                                       -- Don't create backups
opt('o', 'equalalways', false)                                                  -- Stop windows being resized (to stop todo.txt from being resized)
opt('o', 'fileformats', 'unix,dos')                                             -- Recognise unix or dos line-endings, save new files as unix
opt('o', 'foldenable', false)                                                   -- Turn off code folding
opt('o', 'hidden', true)                                                        -- hide buffers instead of closing
opt('o', 'ignorecase', true)                                                    -- See smartcase
opt('o', 'incsearch', true)                                                     -- Show matches as you type
opt('o', 'laststatus', 2)                                                       -- Always show the statusline
opt('o', 'number', true)                                                        -- line numbers
opt('o', 'path', vim.o.path..'**')                                              -- recursively search files
opt('o', 'scrolloff', 2)                                                        -- Page up/down with 2 extra lines showing above/below cursor position
opt('o', 'showmode', false)                                                     -- Turn off -- INSERT -- in statusline (lightline already shows it)
opt('o', 'signcolumn', 'yes')                                                   -- Keeps sign column from jumping around when fixing errors
opt('o', 'smartcase', true)                                                     -- Case insensitive search when characters in pattern are lowercase
opt('o', 'splitbelow', true)                                                    -- Open new horizontal splits below the current one
opt('o', 'splitright', true)                                                    -- Open new vertical splits to the right of the current one
opt('o', 'swapfile', false)                                                     -- Don't create temporary swap files
opt('o', 'termguicolors', true)                                                 -- True color support
opt('o', 'updatetime', 100)                                                     -- Bring down delay for diagnostic messages
opt('o', 'wildignore', vim.o.wildignore..'.git/**,tmp/**,coverage/**,log/**,db/migrate/**,node_modules/**,bin/**,**/*.min.js')
opt('o', 'wildmenu', true)                                                      -- TAB completion in COMMAND mode
opt('o', 'writebackup', false)                                                  -- Don't create backups

g.ayucolor = 'mirage'                                                           -- Sub-theme for Ayu theme
cmd 'colorscheme ayu'                                                           -- Set theme

local a = {}; for i=0,500 do a[i]=i+81 end                                      -- Grey out everything past 80 columns
opt('w', 'colorcolumn', table.concat(a, ','))

--
--syntax on                                                                       -- Turn on syntax highlighting
--[[
-- hi! link CursorLine Visual|                                                     -- Make CursorLine highlight more visible (also used by coc lists)
-- hi Search guibg=#1271a1|                                                         -- More subtle color for search highlighting and fuzzy search in coc

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plugin settings

-- let g:python3_host_prog = 'C:\Python39\python.exe'                              -- Python providers
-- let g:python_host_prog = 'C:\Python27\python.exe'                               -- Python providers
let NERDTreeQuitOnOpen=1                                                        -- close NERDTree after opening file
let g:scratch_persistence_file = '.scratch.vim'                                 -- Store scratch text in project .scratch.vim file
let g:scratch_horizontal = 1                                                    -- Open scratch split horizontally
let g:scratch_height = 15                                                       -- with height of 20 rows
let g:lightline = { 'colorscheme': 'ayu' }                                      -- Set same theme as colorscheme for lightline.vim
let g:lightline.component_function = { 'filename': 'FilenameForLightline' }     -- Calls FilenameForLightline function to show full path name in statusline
let powershell = 'term://pwsh -C'                                          -- Used by terminal split mappings to use PowerShell as the terminal shell
let g:diagnostic_insert_delay = 1
let g:completion_enable_auto_popup = 0                                          -- completion-nvim: Disable auto popup of completion
let g:completion_enable_snippet = 'UltiSnips'                                   -- completion-nvim: Enable UltiSnips integration
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc|hi! link pandocStrong Operator|hi! link pandocEmphasis Delimiter
augroup END

lua << EOF

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

-- Show diagnostics in a popup window instead of after source code
local nvim_command = vim.api.nvim_command
local on_attach = function(client)
  require'completion'.on_attach(client)
  nvim_command('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
-- disable virtual text
virtual_text = false,

-- show signs
signs = true,

-- delay update diagnostics
update_in_insert = false,
-- display_diagnostic_autocmds = { 'InsertLeave'  },


}

)

lspconfig.fsharp.setup{on_attach = on_attach}
lspconfig.tsserver.setup{on_attach = on_attach}
lspconfig.solargraph.setup{on_attach = on_attach}
EOF


---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Key Mappings

inoremap <silent><expr>  <Tab> RunCompletionOrNextItemOrSnippet()|              -- Potentially open completion list by pressing TAB
inoremap <silent><expr> <S-Tab> PreviousCompletionItem()|                       -- Go to previous item in completion list if open

nnoremap <silent> <Space> :nohlsearch<CR>|                                      -- SPACE to turn off search highlight
nnoremap <C-p> :Files<CR>|                                                      -- CTRL+p to open Fuzzy File Finder
nnoremap <C-f> :NERDTreeToggle<CR>|                                             -- CTRL+f to open NERDTree file browser
nnoremap <C-u> :UndotreeToggle<CR>|                                             -- Show undo tree
nnoremap <C-b> :Buffers<CR>|                                                    -- CTRL+b to open buffer list - currently open files
nnoremap <C-d> :OpenDiagnostic<CR>|                                             -- CTRL+d to open diagnostics - aka errors, warnings and hints to correct
nnoremap <C-s> <cmd>lua vim.lsp.buf.workspace_symbol()<CR>|                     -- CTRL+s to open symbol list (for entire workspace)- Fuzzy find types, functions, etc
--nnoremap <C-z> :CocCommand snippets.editSnippets<CR>|                           -- CTRL+z to edit snippets for current file type

nnoremap j gj|                                                                  -- Move down single lines when wrapped
nnoremap k gk|                                                                  -- Move down single lines when wrapped
nmap go :Scratch<CR>
nmap gp :ScratchPreview<CR>

noremap zz <c-w>_ \| <c-w>\||                                                   -- Zoom in and maximize current window
noremap zo <c-w>=|                                                              -- Zoom out and equalize windows

nnoremap ta :tabe<CR>|                                                          -- Add tab pane
nnoremap tc :tabc<CR>|                                                          -- Clear (remove) tab pane
nnoremap tn :tabn<CR>|                                                          -- Next tab pane
nnoremap tp :tabp<CR>|                                                          -- Previous tab pane
nnoremap tt :tabe<CR>:exec 'edit '.powershell<CR>|                              -- Open terminal in new tab

nnoremap <CR> :cn<CR>|                                                          -- Next quickfix entry
nnoremap <Leader><CR> :cp<CR>|                                                  -- Previous quickfix entry

nnoremap <F6> :setlocal spell!<CR>|                                             -- Toggle spellcheck
nnoremap <silent> <F7> :call DeleteTermBuffer()<CR>|                            -- Close build/test terminal split
nnoremap <silent> <F8> :call Run('build')<CR>|                                  -- Runs ./build in a terminal split
nnoremap <silent> <F9> :call Run('test')<CR>|                                   -- Run tests in a terminal
nnoremap <silent> <S-F9> :call Run('test', 'GRAPH')<CR>|                        -- Run tests in a terminal with GRAPH directive
nnoremap <silent> <F10> :call Run('run')<CR>|                                   -- Run the project
nnoremap <silent> <S-F10> :call Run('run_release')<CR>|                         -- Run the project
nnoremap <silent> <Leader><F10> :call Run('bench')<CR>|                         -- Run BenchmarkDotNet
nnoremap <silent> <F11> :call Run('clean')<CR>|                                 -- Clean the project

nnoremap <silent> [g :PrevDiagnosticCycle|                                      -- diagnostic-nvim: Navigate diagnostics
nnoremap <silent> ]g :NextDiagnosticCycle|                                      -- diagnostic-nvim: Navigate diagnostics
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>|                     -- LSP: Goto definition
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>|                     -- LSP: List references - ENTER to go to next
nnoremap <silent>K <cmd>lua vim.lsp.buf.hover()<CR>|                            -- LSP: Show documentation
nnoremap <silent>X <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>|     -- LSP: Show errors in floating window (in case of long lines)
inoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>|              -- LSP: Show signature (only works when opening parens)

nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>|              -- LSP: Not supported by F# LS

tnoremap <A-e> <C-\><C-n>|                                                      -- ALT+e switches to NORMAL mode from TERMINAL mode
tnoremap <A-h> <C-\><C-n><C-w>h|                                                --
tnoremap <A-j> <C-\><C-n><C-w>j|                                                -- ALT+(hjkl) to navigate splits from any mode
tnoremap <A-k> <C-\><C-n><C-w>k|                                                -- including TERMINAL mode.
tnoremap <A-l> <C-\><C-n><C-w>l|                                                --
inoremap <A-h> <C-\><C-n><C-w>h|                                                -- CTRL+(hjkl) to navigate splits from NORMAL mode
inoremap <A-j> <C-\><C-n><C-w>j|                                                --
inoremap <A-k> <C-\><C-n><C-w>k|                                                --
inoremap <A-l> <C-\><C-n><C-w>l|                                                --
nnoremap <A-h> <C-w>h|                                                          --
nnoremap <A-j> <C-w>j|                                                          --
nnoremap <A-k> <C-w>k|                                                          --
nnoremap <A-l> <C-w>l|                                                          --
nnoremap <C-h> <C-w>h|                                                          --
nnoremap <C-j> <C-w>j|                                                          --
nnoremap <C-k> <C-w>k|                                                          --
nnoremap <C-l> <C-w>l|                                                          --

nnoremap <Leader>a :source $HOME/.config/nvim/init.vim<CR>|                     -- Reload Vim config
nnoremap <silent> <Leader>d :bd<CR>|                                            -- delete buffer
nnoremap <silent> <Leader>dd :bufdo bd<CR>|                                     -- delete all buffers
nnoremap <silent> <Leader>td :call ReloadThemeAndLightline('mirage')<CR>|       -- Set dark colorscheme
nnoremap <silent> <Leader>tl :call ReloadThemeAndLightline('light')<CR>|        -- Set light colorscheme
nnoremap <silent> <Leader>h :exec 'topleft vsplit ' . powershell<CR>|           -- Terminal far left split
nnoremap <silent> <Leader>i :setlocal number!<CR>|                              -- Toggle line numbers
nnoremap <silent> <Leader>j :exec 'botright split ' . powershell<CR>|           -- Terminal bottom split
nnoremap <silent> <Leader>k :exec 'topleft split ' . powershell<CR>|            -- Terminal top split
nnoremap <silent> <Leader>l :exec 'botright vsplit ' . powershell<CR>|          -- Terminal far right split
nnoremap <silent> <Leader>n :bn<CR>|                                            -- next buffer
nnoremap <silent> <Leader>o :set paste!<CR>|                                    -- Toggle paste formatting
nnoremap <silent> <Leader>p :bp<CR>|                                            -- previous buffer
nnoremap <silent> <Leader>v :tabe<CR>:e $CODE_DIR/dotfiles/files/config/nvim/init.vim<CR>|-- edit vimrc
nnoremap <Leader>do :topleft split $CODE_DIR/../todo/todo.txt<CR>:resize 20<CR>|-- Open TODO list

-- map <C-z> <Nop>                                                               -- Turn off stupid CTRL keys - Overriden by edit snippets
-- map <C-s> <Nop>                                                               -- Turn off stupid CTRL keys - Overriden by symbols, above
map <C-q> <Nop>|                                                                -- Turn off stupid CTRL keys



---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Auto Commands

augroup mygroup
  autocmd!|                                                                     -- Clear out all autocmds for this augroup

  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>|                     -- Ensure Enter is not remapped in Quickfix so found files can be selected for example
  autocmd InsertEnter * setlocal cursorline                                     -- Highlight current line while in insert mode
  autocmd InsertLeave * setlocal nocursorline
  autocmd FileType fsharp let b:AutoPairs = AutoPairsDefine({'(*' : '*)//n'})|  -- Define auto-pair for F# multiline comments

  autocmd bufread *.fsx,*.fs syn region fsharpMultiLineComment
        \ start='(\*' end='\*)' contains=fsharpTodo,@Spell                      -- Enable spell checking in multi-line F# comments
  autocmd bufenter * call QuitNERDTree()|                                       -- quit vim if NERDTree is last window
  autocmd BufLeave todo.txt resize 2 | normal gg                                -- Resize todo window on leaving
  autocmd BufEnter todo.txt resize 20 | set wfh                                 -- Resize todo window on entering

  autocmd Filetype fsharp setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END


---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Functions

function SetTermInsert()                                                        -- Turn on insert mode
  augroup TermInsert
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
endfunction
call SetTermInsert()                                                            -- Make insert mode for starting terminals the default

function SwitchOutOfTerm()                                                      -- Switch back to previous window after running build command
  let g:termbuffer = bufnr('%')                                                 -- Store terminal buffer used to run build
  execute 'normal G'|                                                           -- Move to bottom of output
  wincmd p                                                                      -- Switch to previous window
  call SetTermInsert()                                                          -- Reset back to insert mode when starting terminal window
endfunction

function Run(command)                                                           -- Run a build command e.g. 'run', 'test', 'build'
  call DeleteTermBuffer()

  augroup TermInsert                                                            -- Disable insert mode on entering terminal and switch to previous window
    autocmd!
    autocmd TermOpen * call SwitchOutOfTerm()
  augroup END

  execute ':botright split '.g:powershell.' ./'.a:command
endfunction

function DeleteTermBuffer()                                                     -- Removes the terminal buffer used to run commands
  if exists('g:termbuffer')
    execute g:termbuffer.'bd!'
    unlet g:termbuffer
  endif
endfunction

function QuitNERDTree()                                                         -- Exit vim if NERDTree is the last window open
  if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree())
    q
  endif
endfunction

function ThemeLoad(theme)                                                       -- Set the passed in theme variation and reinit colorscheme
  let g:ayucolor=a:theme
  colorscheme ayu

  highlight CocUnderline cterm=underline gui=underline|                         -- Redisplay error underlines that disappear when switching themes
endfunction

function LightlineLoad(theme)                                                   -- Set the passed in theme variation and reinit lightline.vim
  let g:lightline.colorscheme = a:theme
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function FilenameForLightline()                                                 -- Show full paths in lightline.vim statusline
    return expand('%')
endfunction

function ReloadThemeAndLightline(theme)                                         -- Reload both colorscheme and lightline when changing theme variation
  call ThemeLoad(a:theme)
  call LightlineLoad('ayu_'.a:theme)
endfunction

function IsSpaceBehind() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function RunCompletionOrNextItemOrSnippet()
  if pumvisible()
    return '\<C-n>'
  elseif IsSpaceBehind()                                                        -- Insert a Tab if there is a space behind the cursor
    return '\<Tab>'
  else
    return '\<C-x>\<C-o>'
  endif                                                                         -- behind the current position
endfunction

function PreviousCompletionItem()                                               -- If completion list is open go to the previous item in the list
  return pumvisible() ? '\<C-p>' : '\<S-Tab>'                                   -- otherwise send SHIFT+TAB
endfunction

--]]
