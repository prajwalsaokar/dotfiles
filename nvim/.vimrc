"neovim defaults
set nocompatible
syntax on	
set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set laststatus=2
set ruler
set sessionoptions-=options
set showcmd
set sidescroll=1
set smarttab
set ttyfast
set viminfo+=!
set noswapfile
set wildmenu
set autoread
set backspace=indent,eol,start
set belloff=all
set complete-=i
set display=lastline
set tabstop=4
set shiftwidth=4

"Load vim-plug
call plug#begin('~\.config\nvim\plugged')
Plug 'romgrk/doom-one.vim'
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
Plug 'goerz/jupytext.vim'
call plug#end()


inoremap jj <esc>
inoremap <C-e> <C-o>de
tnoremap <Esc> <C-\><C-n><CR>
set shell=setbash
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
"Autosave
au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif
"Remap leader to Space
let mapleader = "\<Space>"

"clipboard
set clipboard+=unnamedplus

"Always center the line cursor is on
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END
"Vimwiki attachment setup
function! VimwikiLinkHandler(link)
    if a:link =~ '\.\(pdf\|jpg\|jpeg\|png\|gif\)$'
        call vimwiki#base#open_link(':e ', 'file:'.a:link)
        return 1
    endif
    return 0
endfunction

"set colorscheme to onedark
colorscheme doom-one

"Vimwiki configuration
let g:vimwiki_list = [{'path':'$HOME\Dropbox\wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

