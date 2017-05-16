"" ┌───────────────────┐
"" │    vimrc setup    │
"" └───────────────────┘
:se nu              " set numbers
:set wrapmargin=0   " set width of number margins
:set ruler
:set tabstop=4      " set characters in tab
:set shiftwidth=4
:set expandtab

"" ┌───────────────────┐
"" │    theme setup    │
"" └───────────────────┘
syntax enable       " set dracula dark theme 
colorscheme darcula

:highlight LineNr ctermfg=DarkGrey guifg=DarkGrey " over-ride num highlighting

"" ┌───────────────────┐
"" │    spell check    │
"" └───────────────────┘
:setlocal spell spelllang=en_us " to turn off inline type :set nospell
"" ctrl+j replace next word, ctrl+k replace previous word
noremap <C-K> <Esc>[s1z=
noremap <C-J> <Esc>]s1z=
"" "zg" adds word "zw" removes word from dictionary. "z+" gives word options 

"" ┌───────────────────┐
"" │     pathogen      │
"" └───────────────────┘
execute pathogen#infect()  
syntax on
filetype plugin indent on

"" turn off warning from .ycm_extra_conf.py
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'


"" ┌───────────────────┐
"" │   build programs  │
"" └───────────────────┘
"" make program from terminal 
noremap <F5> :w<CR> :make<CR> <CR> 

"" build latex document
noremap <F3> :w<CR> :!pdflatex %<CR> <CR>

"" run program automatically from terminal 
noremap <F10> :w<CR> :silent !clear; make<CR> :!echo "-------- Running --------"; "./%<"<CR>

"" debug c program with CounqueGDB
noremap <F9> :w<CR> :make<CR> :ConqueGdb  "%<"<CR> 
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_Color = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_Interrupt = '<C-g><C-c>'
let g:ConqueTerm_ReadUnfocused = 1
