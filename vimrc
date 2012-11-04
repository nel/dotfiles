runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
call pathogen#infect()

filetype off
"call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

" Security
set modelines=0

" Tabs/spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround                  " use multiple of shiftwidth when indenting
set autoindent                  " use auto indent, use set paste to copy text in Term
set copyindent                  " copy indentation on autoindent
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop

" Basic options
set number
set autowrite                   " Automatically save before commands like :next and :make
set encoding=utf-8              " 2011 baby !
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline                  " display the current line
set ttyfast
set ruler
set backspace=indent,eol,start  " backspc over every char in insert mode
set laststatus=2                " Always a status line
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.rbx,*~,vendor/cache/*,sass-cache/*,tmp/* " ignore during file completion
set title                       " change the terminal's title
set visualbell                  " beep visually
set noerrorbells                " don't beep

" Status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" Backups
set backupdir=~/.vim/tmp/backup/    " backups
set directory=~/.vim/tmp/swap/      " swap files
set backup                          " enable backups

" Leader
let mapleader = ","                 " Remap leader key to more accessible one

" Searching
" activate magic sequence in search, all regexp special char need escaping
"nnoremap / /\v
"vnoremap / /\v
set ignorecase               " ignore case
set smartcase                " ignore case if lowercase search, case-sensitive otherwise
set incsearch                " live matching
set hlsearch                 " highlight match
set gdefault                 " /g options per default, match all result in a line
map <leader><space> :noh<cr> " Get rid of highlighting

" Parenthesis
set showmatch                   " show matching parenthesis
runtime macros/matchit.vim      " better parenthesis matching
nmap <tab> %                    " tab to go to corresponding parenthesis
vmap <tab> %

" Soft/hard wrapping
set wrap
set textwidth=79
set formatoptions=qrn1


" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

" Color scheme (terminal)
syntax on
set background=dark
colorscheme molokai

" NERD Tree
map <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$']

" MOVEMENT ---------------------------------------

" Use the damn jkl; keys
nnoremap <Left> :echoe "Use h !!!"<CR>
nnoremap <Right> :echoe "Use l !!!"<CR>
nnoremap <Up> :echoe "Use k !!!"<CR>
nnoremap <Down> :echoe "Use j !!!"<CR>

"       Quick window switch.
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <C-h>  <C-w>h
noremap <leader>w <C-w>v<C-w>l

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

map ; :

" Ack
map <leader>a :Ack 

" Yankring
nnoremap <silent> <leader>y :YRShow<cr>

" Edit vim stuff.
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>eb :e $HOME/.bash_profile<cr>
nnoremap <leader>ez :e $HOME/.zshrc<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

if &t_Co >= 256 || has('gui_running')
    set guifont=Monaco:h12
else
    set nocursorline
endif

" Mouse
set mouse=a

" BUNDLE:git://github.com/scrooloose/nerdtree.git

" BUNDLE: https://github.com/wincent/Command-T.git
" BUNDLE-COMMAND: cd command-t && rake make

" BUNDLE: git://github.com/chrismetcalf/vim-yankring.git
 
" BUNDLE: git://github.com/mileszs/ack.vim.git
" BUNDLE: git://github.com/tpope/vim-markdown.git
" BUNDLE: git://github.com/nel/vim-css-color.git

