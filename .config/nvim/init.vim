call plug#begin()
Plug 'ayu-theme/ayu-vim'        " Theme

Plug 'editorconfig/editorconfig-vim'  " Use a project's .editorconfig file for formatting
Plug 'mhinz/vim-signify'              " Git icons in the gutter. vim-gitgutter doesn't seem to work
Plug 'dbeniamine/todo.txt-vim'        " \do - Opens C:\Users\phil\Dropbox\todo\todo.txt
Plug 'jiangmiao/auto-pairs'           " ALT-n - Next bracket pair - Auto-pair brackets.
Plug 'jremmen/vim-ripgrep'            " :Rg <regex> - Folder-wide search
Plug 'junegunn/fzf'                   " CTRL+P - Fast fuzzy file finder
Plug 'mtth/scratch.vim'               " go/gp - Scratchpad
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine with support for VSCode plugins
Plug 'itchyny/lightline.vim'          " Simple statusline
Plug 'scrooloose/nerdtree'            " CTRL+B - open file tree
Plug 'sheerun/vim-polyglot'           " Syntax, indent, compilers for various languages
Plug 'tpope/vim-fugitive'             " Git plugin - :G for enhanced status. See plugin section below for more
Plug 'tpope/vim-surround'             " cs'<q> - change from single quotes to xml tags
Plug 'tpope/vim-repeat'               " Repeat plugin commands such as surround with `.`
Plug 'pangloss/vim-javascript'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General settings

set autoread            " Reload file if changed by external program
set backspace=2
set clipboard=unnamed   " Use the OS clipboard
set cmdheight=2         " Better display for messages in coc-nvim
execute "set colorcolumn=".join(range(81,335), ',') | " Grey out everything past 80 columns
set expandtab           " Tabs to spaces
set fileformat=unix     " Ensure lf line-endings are used on Windows
set fileformats=unix,dos " Recognise unix or dos line-endings, save new files as unix
set fillchars=vert:\ ,eob:\ |
set hidden              " hide buffers instead of closing
set ignorecase          " See smartcase
set incsearch           " Show matches as you type
set laststatus=2
set nobackup            " Don't create backups
set nowritebackup       " Don't create backups
set nofoldenable        " Turn off code folding
set noshowmode          " Turn off -- INSERT -- in statusline (lightline already shows it)
set noswapfile          " Don't create temporary swap files
set number              " line numbers
set scrolloff=2         " Page up/down with 2 extra lines showing above/below cursor position
set shiftwidth=2
set shortmess+=c        " Don't give |ins-completion-menu| messages (coc-nvim)
set smartcase           " Case insensitive search when characters in pattern are lowercase
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set updatetime=300      " Bring down delay for diagnostic messages (coc-nvim)

" SPACE to turn off search highlight
nnoremap <silent> <Space> :nohlsearch<CR>

" Turn off stupid CTRL keys
map <C-z> <Nop>
map <C-s> <Nop>
map <C-q> <Nop>

" Python providers
let g:python3_host_prog = 'C:\Python38\python'

" Toggle spellcheck
nnoremap <F6> :setlocal spell!<CR>

" Move up and down single lines when wrapped
nnoremap j gj
nnoremap k gk

" Highlight current line while in insert mode
augroup CursorLine
  au!
  au InsertEnter * setlocal cursorline
  au InsertLeave * setlocal nocursorline
augroup END

" Ensure Enter is not remapped in Quickfix so found files can be selected for
" example
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Logging
let $NVIM_PYTHON_LOG_FILE="C:\Users\phil\Temp\nvim_log"
let $NVIM_NCM_LOG_LEVEL="DEBUG"
let $NVIM_NCM_MULTI_THREAD=0

" Build & Testing
"
" The following runs a terminal split below the current window, removing
" existing build terminals if they still exist
" \b - Runs the ./build script
" \t - Run the ./test script
" \c - Close terminal from a previous test run
" \cb - Run ./clean followed by ./build

" F7
function DeleteTermBuffer()
  if exists('g:termbuffer') 
    execute g:termbuffer.'bd!'
    unlet g:termbuffer
  endif
endfunction

" F8
function RunBuild()
  execute ':botright split term://powershell -NoLogo ./build'
  let g:termbuffer = bufnr('%')
  execute "normal G"
  execute "normal <C-w>k"
endfunction

" F9
function RunProject()
  execute ':botright split term://powershell -NoLogo ./run'
  let g:termbuffer = bufnr('%')
  execute "normal G"
  execute "normal <C-w>k"
endfunction

" F10
function RunTests()
  execute ':botright split term://powershell -NoLogo ./test'
  let g:termbuffer = bufnr('%')
  execute "normal G"
  execute "normal <C-w>k"
endfunction

" F11
function RunCleanBuild()
  execute ':botright split term://powershell -NoLogo ./clean ; ./build'
  let g:termbuffer = bufnr('%')
  execute "normal G"
  execute "normal <C-w>k"
endfunction

let powershell = "term://powershell -NoLogo"

nnoremap <silent> <F7> :call DeleteTermBuffer()<CR>|                            " Close build/test terminal split
nnoremap <silent> <F8> :call DeleteTermBuffer()<CR>:call RunBuild()<CR>|        " Runs ./build in a terminal split
nnoremap <silent> <F9> :call DeleteTermBuffer()<CR>:call RunTests()<CR>|        " Run tests in a terminal
nnoremap <silent> <F10> :call DeleteTermBuffer()<CR>:call RunProject()<CR>|     " Run the project
nnoremap <silent> <F11> :call DeleteTermBuffer()<CR>:call RunCleanBuild()<CR>|  " Run ./clean then ./build in split

" Terminals
" 
" \h, \j, \k, \l - Opens a terminal to the left, down, up or right of the 
" current window respectively.
" (commands are defined in Leaders mappings at the bottom)
" 
" CTRL+ESC - An AutoIt script maps this to exit the terminal
" In Windows CTRL+ESC is bound to the Windows menu

" Make sure we enter insert mode when opening the terminal
" autocmd TermOpen term://* startinsert

" ALT+(hjkl) to navigate windows from insert and terminal modes and
" ALT or CTRL+(hjkl) to navigate in normal mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs
au FileType fsharp let b:AutoPairs = AutoPairsDefine({'(*' : "*)//n"})


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
set wildmenu " display files with TAB
set wildignore+=.git/**,tmp/**,coverage/**,log/**,db/migrate/**,node_modules/**,bin/**,**/*.min.js
set path+=** " recursively search files
nnoremap <C-p> :FZF<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-nvim

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Restart Coc (when build marks get out of sync - e.g. when adding files to
" project)
nnoremap <silent> <F12> :CocRestart<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scratch.vim
let g:scratch_persistence_file = '.scratch.vim'
let g:scratch_horizontal = 1
let g:scratch_height = 20
nmap go :Scratch<CR>
nmap gp :ScratchPreview<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ayu-theme/ayu-vim
set termguicolors

function! ThemeLoad(theme)
  let g:ayucolor=a:theme
  colorscheme ayu

  " Redisplay error underlines that disappear when switching themes
  highlight CocUnderline cterm=underline gui=underline
endfunction

" let g:ayucolor=theme is done on nvim load (through bin\vim.cmd or bin\vimlt.cmd)
" Calling colorscheme here loads the prevously selected theme.
colorscheme ayu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline.vim
" Replace filename component of Lightline statusline & show full path
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ }
      \ }

function! LightlineLoad(theme)
  let g:lightline.colorscheme = a:theme
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! FilenameForLightline()
    return expand('%')
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree

nnoremap <C-b> :NERDTreeToggle<CR>

" quit vim if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

"close NERDTree after opening file
let NERDTreeQuitOnOpen=1 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-polyglot
syntax on

" Enable spell checking in multi-line F# comments
" autocmd bufread *.fsx,*.fs syn region fsharpMultiLineComment start="(\*" end="\*)" contains=fsharpTodo,@Spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings

nnoremap <silent> <Leader>a :source $XDG_CONFIG_HOME/nvim/init.vim<CR>|         " Reload Vim config
nnoremap <silent> <Leader>d :bd<CR>|                                            " delete buffer
nnoremap <silent> <Leader>dd :bufdo bd<CR>|                                     " delete all buffers
nnoremap <silent> <Leader>e :call ThemeLoad("mirage")<CR>:call LightlineLoad("ayu_mirage")<CR> | " Set dark colorscheme
nnoremap <silent> <Leader>ee :call ThemeLoad("light")<CR>:call LightlineLoad("ayu_light")<CR> |  " Set light colorscheme
nnoremap <silent> <Leader>h :exec "topleft vsplit " . powershell<CR> |          " Terminal far left split
nnoremap <silent> <Leader>i :setlocal number!<CR>|                              " Toggle line numbers
nnoremap <silent> <Leader>j :exec "botright split " . powershell<CR> |          " Terminal bottom split
nnoremap <silent> <Leader>k :exec "topleft split " . powershell<CR>  |          " Terminal top split
nnoremap <silent> <Leader>l :exec "botright vsplit " . powershell<CR>|          " Terminal far right split
nnoremap <silent> <Leader>n :bn<CR>|                                            " next buffer
nnoremap <silent> <Leader>o :set paste!<CR>|                                    " Toggle paste formatting
nnoremap <silent> <Leader>p :bp<CR>|                                            " previous buffer
nnoremap <silent> <Leader>vim :e $XDG_CONFIG_HOME/nvim/init.vim<CR>|            " edit vimrc
nnoremap <Leader>do :sp<CR>:e $USERPROFILE/Dropbox/todo/todo.txt<CR>|           " Open TODO list

