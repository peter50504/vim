filetype plugin on
set mouse=a
syntax on
colo peachpuff
set t_Co=256
hi LineNr ctermfg=252 ctermbg=NONE
hi Visual ctermfg=NONE ctermbg=NONE
hi Search ctermfg=NONE ctermbg=239
"
let mapleader = ' '
inoremap jk <ESC>
nnoremap <leader>d dd
nnoremap <leader>qq :noh<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap ( ()<Esc>i
"
set number
set encoding=utf-8
set clipboard=unnamedplus
set laststatus=2
set statusline=[%{expand('%:p')}][%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%{FileSize()}%{IsBinary()}%=%c,%l/%L\ [%3p%%]

function IsBinary()
    if (&binary == 0)
        return ""
    else
        return "[Binary]"
    endif
endfunction

function FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction
set statusline=%#filepath#[%{expand('%:p')}]%#filetype#[%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%#filesize#%{FileSize()}%{IsBinary()}%=%#position#%c,%l/%L\ [%3p%%]

hi filepath cterm=none ctermbg=238 ctermfg=147
hi filetype cterm=none ctermbg=238 ctermfg=147
hi filesize cterm=none ctermbg=238 ctermfg=147
hi position cterm=none ctermbg=238 ctermfg=147
