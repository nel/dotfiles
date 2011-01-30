" Not support in the osX vi and version conditional does not work either
set relativenumber
set undofile
set colorcolumn=85

" MacVim {{{2
if has('gui_macvim')
    " Full-screen mode uses the full screen
    set fuoptions=maxvert,maxhorz

    " Cmd-Right and Cmd-Left cycle tabs forward and backward
    nmap <D-Right> :tabnext<cr>
    imap <D-Right> <c-o>:tabnext<cr>
    vmap <D-Right> <c-o>:tabnext<cr>
    nmap <D-Left> :tabprevious<cr>
    imap <D-Left> <c-o>:tabprevious<cr>
    vmap <D-Left> <c-o>:tabprevious<cr>
endif


