""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Contents
" --------
"   
"   Plugins
"   General settings
"   Plugin settings
"   Key mappings
"   Auto commands
"   Functions
"   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (sorted by plugin name minus any vim prefix)

call plug#begin()

Plug 'jiangmiao/auto-pairs'                                                     " ALT-n - Next bracket pair - Auto-pair brackets.
Plug 'ayu-theme/ayu-vim'                                                        " Color scheme
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                 " Intellisense engine with support for VSCode plugins
Plug 'editorconfig/editorconfig-vim'                                            " Use a project's .editorconfig file for formatting
Plug 'tpope/vim-fugitive'                                                       " Git plugin - :G for enhanced status. See plugin section below for more
Plug 'itchyny/lightline.vim'                                                    " Simple statusline
Plug 'scrooloose/nerdtree'                                                      " CTRL+B - open file tree
Plug 'sheerun/vim-polyglot'                                                     " Syntax, indent, compilers for various languages
Plug 'tpope/vim-repeat'                                                         " Repeat plugin commands such as surround with `.`
Plug 'jremmen/vim-ripgrep'                                                      " :Rg <regex> - Folder-wide search
Plug 'mtth/scratch.vim'                                                         " go/gp - Scratchpad
Plug 'mhinz/vim-signify'                                                        " Git icons in the gutter. vim-gitgutter doesn't seem to work
Plug 'tpope/vim-surround'                                                       " cs'<q> - change from single quotes to xml tags
Plug 'dbeniamine/todo.txt-vim'                                                  " \do - Opens C:\Users\phil\Dropbox\todo\todo.txt
Plug 'mbbill/undotree'                                                          " :UndotreeToggle/F5 - Visualise the undo tree

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings (sorted)

set autoread                                                                    " Reload file if changed by external program
set backspace=2                                                                 " Go back 2 sapces when pressing backspace
set clipboard=unnamed                                                           " Use the OS clipboard
set cmdheight=2                                                                 " Better display for messages in coc-nvim
set expandtab                                                                   " Tabs to spaces
set fileformat=unix                                                             " Ensure lf line-endings are used on Windows
set fileformats=unix,dos                                                        " Recognise unix or dos line-endings, save new files as unix
set hidden                                                                      " hide buffers instead of closing
set ignorecase                                                                  " See smartcase
set incsearch                                                                   " Show matches as you type
set laststatus=2                                                                " Always show the statusline
set nobackup                                                                    " Don't create backups
set nofoldenable                                                                " Turn off code folding
set noshowmode                                                                  " Turn off -- INSERT -- in statusline (lightline already shows it)
set noswapfile                                                                  " Don't create temporary swap files
set nowritebackup                                                               " Don't create backups
set number                                                                      " line numbers
set path+=**                                                                    " recursively search files
set scrolloff=2                                                                 " Page up/down with 2 extra lines showing above/below cursor position
set shiftwidth=2                                                                " Default tabs for when there is no .editorconfig
set shortmess+=c                                                                " Don't give |ins-completion-menu| messages (coc-nvim)
set signcolumn=yes                                                              " Keeps sign column from jumping around when fixing errors
set smartcase                                                                   " Case insensitive search when characters in pattern are lowercase
set softtabstop=2                                                               " Default tabs for when there is no .editorconfig
set splitbelow                                                                  " Open new horizontal splits below the current one
set splitright                                                                  " Open new vertical splits to the right of the current one
set tabstop=2                                                                   " Default tabs for when there is no .editorconfig
set termguicolors                                                               " Enable 24-bit RGB colors
set updatetime=300                                                              " Bring down delay for diagnostic messages (coc-nvim)
set wildignore+=.git/**,tmp/**,coverage/**,log/**,db/migrate/**                 " Set ignore paths for wildmenu
set wildignore+=node_modules/**,bin/**,**/*.min.js                              " Set ignore paths for wildmenu
set wildmenu                                                                    " TAB completion in COMMAND mode

syntax on                                                                       " Turn on syntax highlighting
colorscheme ayu                                                                 " Uses g:ayucolor=<theme> from ~/bin/vim.cmd or ~/bin/vimlt.cmd to set mirage/light colorscheme
execute "set colorcolumn=".join(range(81,335), ',')|                            " Grey out everything past 80 columns
hi! link CursorLine Visual


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings

let g:python3_host_prog = 'C:\Python38\python'                                  " Python providers
let NERDTreeQuitOnOpen=1                                                        "close NERDTree after opening file
let g:scratch_persistence_file = '.scratch.vim'                                 " Store scratch text in project .scratch.vim file
let g:scratch_horizontal = 1                                                    " Open scratch split horizontally 
let g:scratch_height = 20                                                       " with height of 20 rows
let g:lightline = { 'colorscheme': 'ayu' }                                      " Set same theme as colorscheme for lightline.vim
let g:lightline.component_function = { 'filename': 'FilenameForLightline' }     " Calls FilenameForLightline function to show full path name in statusline
let g:lightline.active={ 'left': [['mode', 'paste'], ['cocstatus', 'readonly', 'filename', 'modified']] }
let g:lightline.component_function.cocstatus='coc#status'
let powershell = "term://powershell -NoLogo"                                    " Used by terminal split mappings to use PowerShell as the terminal shell



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings

inoremap <silent><expr> <Tab> RunCompletionOrNextItem()|                        " Potentially open completion list by pressing TAB
inoremap <expr><S-TAB> PreviousCompletionItem()|                                " Go to previous item in completion list if open
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"|                  " Use <cr> to confirm completion, otherwise Vim inserts a CR. `<C-g>u` breaks undo chain

nnoremap <silent> <Space> :nohlsearch<CR>|                                      " SPACE to turn off search highlight
nnoremap <C-p> :CocList files<CR>|                                              " CTRL+p to open Fuzzy File Finder with Coc-List
nnoremap <C-f> :NERDTreeToggle<CR>|                                             " CTRL+f to open NERDTree file browser
nnoremap <C-u> :UndotreeToggle<CR>|                                             " Show undo tree
nnoremap <C-b> :CocList buffers<CR>|                                            " CTRL+b to open buffer list
nnoremap <C-d> :CocList diagnostics<CR>|                                        " CTRL+d to open diagnostics, a list of errors, warnings and hints to correct
nnoremap j gj|                                                                  " Move down single lines when wrapped
nnoremap k gk|                                                                  " Move down single lines when wrapped
nmap go :Scratch<CR>
nmap gp :ScratchPreview<CR>

noremap zz <c-w>_ \| <c-w>\||                                                   " Zoom in and maximize current window
noremap zo <c-w>=|                                                              " Zoom out and equalize windows

nnoremap <F6> :setlocal spell!<CR>|                                             " Toggle spellcheck
nnoremap <silent> <F7> :call DeleteTermBuffer()<CR>|                            " Close build/test terminal split
nnoremap <silent> <F8> :call Run('build')<CR>|                                  " Runs ./build in a terminal split
nnoremap <silent> <F9> :call Run('test')<CR>|                                   " Run tests in a terminal
nnoremap <silent> <F10> :call Run('run')<CR>|                                   " Run the project
nnoremap <silent> <F11> :call Run('clean')<CR>|                                 " Clean the project
nnoremap <silent> <F12> :CocRestart<CR>|                                        " Restart Coc (when error marks get out of sync - e.g. when adding files to project)

map <C-z> <Nop>|                                                                " Turn off stupid CTRL keys
map <C-s> <Nop>|                                                                " Turn off stupid CTRL keys
map <C-q> <Nop>|                                                                " Turn off stupid CTRL keys

nmap <silent> [g <Plug>(coc-diagnostic-prev)|                                   " Coc: Navigate diagnostics
nmap <silent> ]g <Plug>(coc-diagnostic-next)|                                   " Coc: Navigate diagnostics
nmap <silent> gd <Plug>(coc-definition)|                                        " Coc: Goto function definition
nmap <silent> gr <Plug>(coc-references)|                                        " Coc: List references to function
nmap <silent> gy <Plug>(coc-type-definition)|                                   " Coc: Show type definition - Doesn't seem to work for F#
nmap <silent> gi <Plug>(coc-implementation)|                                    " Coc: Show implementation - Doesn't seem to work for F#
nmap <silent> rn <Plug>(coc-rename)|                                            " Coc: Rename symbol under cursor"
nnoremap <silent> K :call ShowDocumentation()<CR>|                              " Coc: Show documentation for item under cursor (FSLS Feature: Hover)

tnoremap <A-e> <C-\><C-n>|                                                      " ALT+e switches to NORMAL mode from TERMINAL mode
tnoremap <A-h> <C-\><C-n><C-w>h|                                                " 
tnoremap <A-j> <C-\><C-n><C-w>j|                                                " ALT+(hjkl) to navigate splits from any mode
tnoremap <A-k> <C-\><C-n><C-w>k|                                                " including TERMINAL mode.
tnoremap <A-l> <C-\><C-n><C-w>l|                                                " 
inoremap <A-h> <C-\><C-n><C-w>h|                                                " CTRL+(hjkl) to navigate splits from NORMAL mode
inoremap <A-j> <C-\><C-n><C-w>j|                                                " 
inoremap <A-k> <C-\><C-n><C-w>k|                                                " 
inoremap <A-l> <C-\><C-n><C-w>l|                                                " 
nnoremap <A-h> <C-w>h|                                                          " 
nnoremap <A-j> <C-w>j|                                                          "  
nnoremap <A-k> <C-w>k|                                                          " 
nnoremap <A-l> <C-w>l|                                                          " 
nnoremap <C-h> <C-w>h|                                                          " 
nnoremap <C-j> <C-w>j|                                                          " 
nnoremap <C-k> <C-w>k|                                                          " 
nnoremap <C-l> <C-w>l|                                                          " 

nnoremap <Leader>a :source $XDG_CONFIG_HOME/nvim/init.vim<CR>|                  " Reload Vim config
nnoremap <silent> <Leader>d :bd<CR>|                                            " delete buffer
nnoremap <silent> <Leader>dd :bufdo bd<CR>|                                     " delete all buffers
nnoremap <silent> <Leader>td :call ReloadThemeAndLightline("mirage")<CR>|       " Set dark colorscheme
nnoremap <silent> <Leader>tl :call ReloadThemeAndLightline("light")<CR>|        " Set light colorscheme
nnoremap <silent> <Leader>h :exec "topleft vsplit " . powershell<CR>|           " Terminal far left split
nnoremap <silent> <Leader>i :setlocal number!<CR>|                              " Toggle line numbers
nnoremap <silent> <Leader>j :exec "botright split " . powershell<CR>|           " Terminal bottom split
nnoremap <silent> <Leader>k :exec "topleft split " . powershell<CR>|            " Terminal top split
nnoremap <silent> <Leader>l :exec "botright vsplit " . powershell<CR>|          " Terminal far right split
nnoremap <silent> <Leader>n :bn<CR>|                                            " next buffer
nnoremap <silent> <Leader>o :set paste!<CR>|                                    " Toggle paste formatting
nnoremap <silent> <Leader>p :bp<CR>|                                            " previous buffer
nnoremap <silent> <Leader>vim :e $XDG_CONFIG_HOME/nvim/init.vim<CR>|            " edit vimrc
nnoremap <Leader>do :sp<CR>:e $USERPROFILE/Dropbox/todo/todo.txt<CR>|           " Open TODO list



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands

augroup mygroup
  autocmd!|                                                                     " Clear out all autocmds for this augroup
  
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()      " Force lightline update
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>|                     " Ensure Enter is not remapped in Quickfix so found files can be selected for example
  autocmd InsertEnter * setlocal cursorline                                     " Highlight current line while in insert mode
  autocmd InsertLeave * setlocal nocursorline
  autocmd FileType fsharp let b:AutoPairs = AutoPairsDefine({'(*' : "*)//n"})|  " Define auto-pair for F# multiline comments

  autocmd bufread *.fsx,*.fs syn region fsharpMultiLineComment 
        \ start='(\*' end='\*)' contains=fsharpTodo,@Spell                      " Enable spell checking in multi-line F# comments
  autocmd bufenter * call QuitNERDTree()|                                       " quit vim if NERDTree is last window
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions

function SetTermInsert()                                                        " Turn on insert mode
  augroup TermInsert                                                            
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
endfunction
call SetTermInsert()                                                            " Make insert mode for starting terminals the default

function SwitchOutOfTerm()                                                      " Switch back to previous window after running build command
  let g:termbuffer = bufnr('%')                                                 " Store terminal buffer used to run build
  execute "normal G"|                                                           " Move to bottom of output
  wincmd p                                                                      " Switch to previous window
  call SetTermInsert()                                                          " Reset back to insert mode when starting terminal window
endfunction

function Run(command)                                                           " Run a build command e.g. 'run', 'test', 'build'
  call DeleteTermBuffer()

  augroup TermInsert                                                            " Disable insert mode on entering terminal and switch to previous window
    autocmd!
    autocmd TermOpen * call SwitchOutOfTerm()
  augroup END
  
  execute ':botright split '.g:powershell.' ./'.a:command
endfunction

function DeleteTermBuffer()                                                     " Removes the terminal buffer used to run commands
  if exists('g:termbuffer') 
    execute g:termbuffer.'bd!'
    unlet g:termbuffer
  endif
endfunction

function QuitNERDTree()                                                         " Exit vim if NERDTree is the last window open
  if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
    q
  endif
endfunction

function ThemeLoad(theme)                                                       " Set the passed in theme variation and reinit colorscheme
  let g:ayucolor=a:theme
  colorscheme ayu
  
  highlight CocUnderline cterm=underline gui=underline|                         " Redisplay error underlines that disappear when switching themes
endfunction

function LightlineLoad(theme)                                                   " Set the passed in theme variation and reinit lightline.vim
  let g:lightline.colorscheme = a:theme
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function FilenameForLightline()                                                 " Show full paths in lightline.vim statusline
    return expand('%')
endfunction

function ReloadThemeAndLightline(theme)                                         " Reload both colorscheme and lightline when changing theme variation
  call ThemeLoad(a:theme)
  call LightlineLoad('ayu_'.a:theme)
endfunction

function IsSpaceBehind() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function RunCompletionOrNextItem()                                              " Open completion list as long there is a non-whitespace character 
  return pumvisible() ? "\<C-n>" : IsSpaceBehind() ? "\<Tab>" : coc#refresh()   " behind the current position, otherwise send a TAB.
endfunction                                                                     " If completion list is open then go to the next item in the list

function PreviousCompletionItem()                                               " If completion list is open to to the previous item in the list
  return pumvisible() ? "\<C-p>" : "\<S-Tab>"                                   " otherwise send SHIFT+TAB
endfunction

function ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * call CocActionAsync('highlight')

" FSLS: Hover - shows documentation - CTRL+K in normal mode
" FSLS: Autocomplete - Show list of methods/function - TAB in insert mode
" FSLS: Method signature help - 
