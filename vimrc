" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'kovisoft/slimv'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"-----------------Things that aren't plugins go below this line -------------------


"TODO: Make it choose between these somehow. /mnt/shared/sbin/tmux is what
"works on c9, but I doubt it will work on the RPi or MacBook.
"let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp" & '
let g:slimv_swank_cmd = '! /mnt/shared/sbin/tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp"'

let g:lisp_rainbow=1
let g:slimv_repl_split=4

set number
set nowrap
set incsearch
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

syntax on
colo peachpuff
"set tabstop=4
"set shiftwidth=4

"Special remappings:

inoremap jj <Esc>
noremap 2O O<CR><Esc>ki

