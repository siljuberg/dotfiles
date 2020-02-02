:colorscheme torte

set clipboard=unnamed
"Yank to Windows clipboard
"nnoremap y "*y | y
"vnoremap y "*y | y

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

"start searching immediately and ignore case
set incsearch
set ic

"Search for visually selected text
vnoremap // y/<C-R>"<CR>

"Delete into black hole register by default
nnoremap x "_x
vnoremap x "_x
vnoremap d "_d
nnoremap d "_d
xnoremap p "_dP

"Center screen after moving
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap * *zz
nnoremap # #zz

" Replace word under cursor with leader key
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
set background=dark
