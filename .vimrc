" David Walkers .vimrc

" Set this directory into the runtime path
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
let s:localvimdir= expand('<sfile>:p:h')
let &runtimepath = printf('%s,%s,%s/after', s:localvimdir, &runtimepath, s:localvimdir)

" General environ options
set nocompatible
set nobackup
set novisualbell

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
set term=xterm-256color

" Spacing Settings
set tabstop=4
set shiftwidth=4
set softtabstop=4

filetype off
set rtp+=~/vimrc/bundle/Vundle.vim
call vundle#begin(expand(s:localvimdir . '/bundle'))
Plugin 'VundleVim/Vundle.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'Bling/vim-airline'
Plugin 'git://github.com/bp1222/phpfolding.vim'
call vundle#end()
filetype plugin indent on

" StatusLine
set laststatus=2

" Remap movement keys to go through multi-line lines
nnoremap j gj
nnoremap k gk
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
