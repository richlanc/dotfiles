" A lot of these settings will be copied from http://amix.dk/vim/vimrc.html
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
Plugin 'gmarik/vundle'

" The bundles you install will be listed here
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'davidhalter/jedi-vim'
Plugin 'rking/ag.vim'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()
" CTRLP
set runtimepath^=~/.vim/bundle/ctrlp.vim

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
set mouse= " Cursor support

set undofile
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
    set guioptions-=r "remove right-hand scroll bar
    set guioptions-=L "remove left-hand scroll bar
    set guioptions-=T "toolbar
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"set listchars=space:\ ,tab:\ \  " Mark all white spaces, whilst remaining spaces
"set list

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

let strip_whitespace_on_save = 1

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

" Spelling
nnoremap <leader>s :setlocal spell spelllang=en_gb<CR>
nnoremap <leader>S :setlocal nospell<CR>

" Save RO files
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line length
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set cc=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line number related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent pluging configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#242424   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#292929   ctermbg=235
