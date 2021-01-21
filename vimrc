" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'kovisoft/slimv'
Plug 'lervag/vimtex'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"-----------------Things that aren't plugins go below this line -------------------


"TODO: Make it choose between these somehow. /mnt/shared/sbin/tmux is what
"works on c9, but I doubt it will work on the RPi or MacBook.
"let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp" & '
let g:slimv_swank_cmd = '! /mnt/shared/sbin/tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp"'

let g:lisp_rainbow = 1
let g:slimv_repl_split=4
let g:slimv_leader = ','

"This is from Castel's blog. I might not want to do the concealment on the
"bottom 2 lines
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

set number
set nowrap
set incsearch
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let mapleader='z'
set directory=.,~/tmp/swap//

syntax on
colo elflord
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

nnoremap <Leader><Space> :set list!<CR> 
set listchars=tab:\|->,trail:_,extends:>,precedes:<
"Special remappings:

inoremap jj <Esc>
noremap 2O O<CR><Esc>ki

noremap <Leader>h h
noremap <Leader>j j
noremap <Leader>k k
noremap <Leader>l l

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
