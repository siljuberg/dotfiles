set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
:colorscheme torte

set number

"Insert line above without entering insert mode
nnoremap <A-o> o<ESC>
nnoremap <A-O> O<ESC>

"Copy everything to clipboard:
nnoremap <A-a> ggVGy
nnoremap <leader> ggVGy


set clipboard=unnamed
"Yank to Windows clipboard
"nnoremap y "*y | y
"vnoremap y "*y | y

"start searching immediately and ignore case
set incsearch
set ic

"Search for visually selected text
vnoremap // y/<C-R>"<CR>

"Delete into black hole register by default
nnoremap x "_x
vnoremap x "_x
"vnoremap d "_d
"nnoremap d "_d
xnoremap p "_dP

"Center screen after moving
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap * *zz
nnoremap # #zz

"Remove
" Replace word under cursor with leader key
":nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"set background=dark
