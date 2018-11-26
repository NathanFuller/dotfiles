" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'kovisoft/slimv'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"-----------------Things that aren't plugins go below this line -------------------


let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp" & '
let g:lisp_rainbow=1

set number
set nowrap
set incsearch
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

syntax on
colo darkblue
"set tabstop=4
"set shiftwidth=4

"Special remappings:

inoremap jj <Esc>
noremap 2O O<CR><Esc>ki

noremap ,h h
noremap ,j j
noremap ,k k
noremap ,l l
