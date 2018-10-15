set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" add testing shortcut
map <F5> :wa<CR>:!python setup.py test<CR>
" set swap folder
set directory=$HOME/.vim/swapfiles//

set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'

"au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab  autoindent fileformat=unix
set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab  autoindent fileformat=unix


Bundle 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1

Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

set backspace=indent,eol,start


Plugin 'altercation/vim-colors-solarized'

set background=dark
colorscheme solarized

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
Plugin 'tpope/vim-fugitive'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set clipboard=unnamed


let mapleader=','
let maplocalleader=','
nnoremap <leader><leader> :NERDTreeToggle<esc>

set scrolloff=8
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

nnoremap K <nop>

function! s:rtws()
  normal! ma
  :%s/\s\+$//e
  normal! `a
endfunction

autocmd BufWritePre * :call s:rtws()

au BufRead,BufNewFile *.tpl set filetype=pan
au BufRead,BufNewFile *.pan set filetype=pan
setlocal omnifunc=pancomplete#Complete
" have powerline everywhere
set laststatus=2
