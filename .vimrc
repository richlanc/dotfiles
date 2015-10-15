" A lot of these settings will be copied from http://amix.dk/vim/vimrc.html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'davidhalter/jedi-vim'

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

set wildmenu " Virtual tab complete for commands
set lazyredraw " Only redraw when it needs too
set showmatch " Show corresponding binding character
set mouse=a " Cursor support

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set number
set showcmd " Show the last command in the bar
set cursorline " Highlight the cursor line

set background=dark

set t_Co=256
color wombat256mod

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=monospace\ 10
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set term=xterm-256color
let g:Powerline_symbols = 'unicode'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>
map <F4> :set list!<CR>

" Split movements
map <c-e> :vsplit<CR>
map <c-o> :split<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"tab movements
map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>

" Leader commands
let mapleader=","
nnoremap <leader><space> :nohlsearch<CR> " Stop highlighting the last command
nnoremap <leader>t :tabnew<CR> " new tab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line length
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set cc=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
