filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set title

" Security
set modelines=0

" Tabs/spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set copyindent

" Basic options
set autowrite       " Automatically save before commands like :next and :make
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" Status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" Backups
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                        " enable backups

" Leader
let mapleader = ","

" Make Y not dumb
nnoremap Y y$

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
map <leader><space> :noh<cr>
runtime macros/matchit.vim
nmap <tab> %
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
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Easy buffer navigation
" Note: For this section to make any sense you need to remap Ctrl-; to Ctrl-g at
"       the KEYBOARD level.  The reason is that for some reason the OS X doesn't
"       recognize the Ctrl+; combination as something special, so it just passes it
"       to Vim as a semicolon.
"
"       Yeah, it's dumb.
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <C-h>  <C-w>h
noremap <leader>w <C-w>v<C-w>l

" Various syntax stuff
au BufNewFile,BufRead *.less set filetype=less
au BufRead,BufNewFile *.scss set filetype=scss

au BufRead,BufNewFile *.confluencewiki set filetype=confluencewiki
au BufRead,BufNewFile *.confluencewiki set wrap linebreak nolist

au BufNewFile,BufRead *.m*down set filetype=markdown
au BufNewFile,BufRead *.m*down nnoremap <leader>1 yypVr=
au BufNewFile,BufRead *.m*down nnoremap <leader>2 yypVr-
au BufNewFile,BufRead *.m*down nnoremap <leader>3 I### <ESC>

au BufNewFile,BufRead *.vim set foldmethod=marker

" Sort CSS
map <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack
map <leader>a :Ack 

" Yankring
nnoremap <silent> <leader>y :YRShow<cr>

" Formatting, TextMate-style
map <leader>q gqip

nmap <leader>m :make<cr>

" Google's JSLint
au BufNewFile,BufRead *.js set makeprg=gjslint\ %
au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G

" TODO: Put this in filetype-specific files
au BufNewFile,BufRead *.less set foldmethod=marker
au BufNewFile,BufRead *.less set foldmarker={,}
au BufNewFile,BufRead *.less set nocursorline
au BufRead,BufNewFile /etc/nginx/conf/* set ft=nginx
au BufRead,BufNewFile /etc/nginx/sites-available/* set ft=nginx
au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
au BufNewFile,BufRead *.js set foldmethod=marker
au BufNewFile,BufRead *.js set foldmarker={,}

" Easier linewise reselection
map <leader>v V`]

" Faster Esc
inoremap jj <ESC>
inoremap kk <ESC>

" Make selecting inside an HTML tag less dumb
nnoremap Vit vitVkoj
nnoremap Vat vatV

" Edit vim stuff.
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>eb :e $HOME/.bash_profile<cr>
nnoremap <leader>ez :e $HOME/.zshrc<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Save when losing focus
" au FocusLost * :wa

if &t_Co >= 256 || has('gui_running')
    set guifont=Monaco:h12

    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    if has("gui_macvim")
        macmenu &File.New\ Tab key=<nop>
    end

    let g:sparkupExecuteMapping = '<D-e>'

    highlight SpellBad term=underline gui=undercurl guisp=Orange
else
    set nocursorline
endif

" Mouse
set mouse=a

" BUNDLE: git://github.com/scrooloose/nerdtree.git

" BUNDLE: https://github.com/wincent/Command-T.git 
" BUNDLE-COMMAND: if which rvm >/dev/null 2>&1; then rvm system exec rake make; else rake make; fi

" BUNDLE: git://github.com/chrismetcalf/vim-yankring.git
 
" BUNDLE: https://github.com/mileszs/ack.vim.git
" BUNDLE: git://github.com/tpope/vim-fugitive.git
" BUNDLE: git://github.com/vim-scripts/jQuery.git
" BUNDLE: git://github.com/tpope/vim-git.git
" BUNDLE: git://github.com/tpope/vim-markdown.git

" Ruby/Rails Programming:
" BUNDLE: git://github.com/vim-ruby/vim-ruby.git
" BUNDLE: git://github.com/tpope/vim-rails.git
" BUNDLE: git://github.com/tpope/vim-rake.git
" BUNDLE: git://github.com/tpope/vim-cucumber.git
" BUNDLE: git://github.com/taq/vim-rspec.git
" # BUNDLE: git://github.com/tpope/vim-haml.git
" BUNDLE: git://github.com/astashov/vim-ruby-debugger.git

