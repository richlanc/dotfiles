autocmd! bufwritepost .vimrc source %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" The bundles you install will be listed here
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'sirtaj/vim-openscad'

Plugin 'vim-syntastic/syntastic'
Plugin 'Vimjas/vim-python-pep8-indent'

"Plugin 'Valloric/YouCompleteMe'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on " Indenting based on filetype

" Set to auto read when a file is changed from the outside
set autoread
set display+=lastline

" dynamic update when searching"
set hlsearch
set incsearch

set lazyredraw " Only redraw when it needs too
set mouse= " Cursor support
set showmatch " Show corresponding binding character
set wildmenu " Virtual tab complete for commands

set undofile
silent ! mkdir -p ~/.vim/undodir
set undodir=~/.vim/undodir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set number
set showcmd " Show the last command in the bar
set cursorline " Highlight the cursor line

set t_Co=256
color wombat256

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=monospace\ 9
    set guioptions-=e
    set guioptions-=L "remove left-hand scroll bar
    set guioptions-=r "remove right-hand scroll bar
    set guioptions-=T "toolbar
    set guitablabel=%M\ %t
    set t_Co=256
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set smartcase "Smart case searching

"let g:strip_whitespace_on_save = 1
"let g:strip_whitespace_confirm = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set term=xterm-256color
set ttimeoutlen=50

" Airline
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_theme='term'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>
map <F4> :set list!<CR>

" Leader commands
let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>

" Spelling
nnoremap <leader>s :setlocal spell spelllang=en_gb<CR>
nnoremap <leader>S :setlocal nospell<CR>

" Save RO files
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line length
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line number related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent pluging configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd  VimEnter,Colorscheme  *  :hi  IndentGuidesOdd  guibg=#242424  ctermbg=234
autocmd  VimEnter,Colorscheme  *  :hi  IndentGuidesEven   guibg=#292929  ctermbg=235

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E265'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode configuration - Don't care for it
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_lint = 1

