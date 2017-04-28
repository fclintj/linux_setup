:se nu              " set numbers
:set wrapmargin=5   " set width of number margins
:set ruler
:set tabstop=4      " set characters in tab
:set shiftwidth=4
:set expandtab

syntax enable       " set dracula dark theme 
colorscheme darcula

:highlight LineNr ctermfg=DarkGrey guifg=DarkGrey " over-ride num highlighting

"" include pathogen addons in build folder
execute pathogen#infect()   
syntax on
filetype plugin indent on

"" add option to toggle NERDTree
map <C-n> :NERDTreeToggle<CR> 
let NERDTreeMouseMode=2

augroup MouseInNERDTreeOnly
        autocmd!
        autocmd BufEnter NERD_tree_* set mouse=a
        autocmd BufLeave NERD_tree_* set mouse=
augroup END
set mouse=

"" run program automatically from terminal 
noremap <F10> :w<CR> :silent !clear; make<CR> :!echo "-------- Running --------"; "./%<"<CR>
