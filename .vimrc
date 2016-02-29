" David Walkers .vimrc

" Set this directory into the runtime path
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
let s:localvimdir= expand('<sfile>:p:h')
let &runtimepath = printf('%s,%s,%s/after', s:localvimdir, &runtimepath, s:localvimdir)

" General environ options
set nocompatible
set nobackup
set novisualbell

filetype off
set rtp+=~/vimrc/bundle/Vundle.vim
call vundle#begin(expand(s:localvimdir . '/bundle'))
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'scrooloose/nerdtree'
Plugin '2072/vim-syntax-for-PHP.git'
Plugin 'nanotech/jellybeans.vim'
Plugin 'git://github.com/bp1222/phpfolding.vim'
call vundle#end()
filetype plugin indent on

colorscheme jellybeans

" Movement
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Searching Options
set incsearch
set hlsearch
set ignorecase
set smartcase

" Completion
set wildmenu
set wildmode=list:longest
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png

" Interface Settings
syntax on
set background=dark
set number
set numberwidth=5
set foldcolumn=3
set smartindent
set showmatch

" List
set list
set listchars=tab:>-,trail:-,nbsp:'

" Spacing Settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" StatusLine
set laststatus=2

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remap movement keys to go through multi-line lines
nnoremap j gj
nnoremap k gk
nnoremap <space> za
vnoremap j gj
vnoremap k gk

" Fix up some filetypes
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.class set filetype=php
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.tpl set filetype=smarty
au BufNewFile,BufRead *.tmpl set filetype=smarty

" Save last position of cursor
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif

" Highlight extra spaces or tabs in red.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" Because => needs space around it
nmap <silent> <C-i>
			\ :%s/\(['"a-zA-Z]\)=>\(['"a-zA-Z0-9$]\)/\1 => \2/g<CR>
