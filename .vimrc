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
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'git://github.com/bp1222/phpfolding.vim'
Plugin 'git://github.com/bp1222/vim-syntax-for-PHP'
Plugin 'git://github.com/bp1222/jellybeans.vim'
call vundle#end()

filetype plugin indent on

" Jellybeans
colorscheme jellybeans

" Indent Guide
let g:indent_guides_enable_on_vim_startup = 1

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
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remap movement keys to go through multi-line lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Space can fold/unfold
nnoremap <space> za

" Fix up some filetypes
au BufNewFile,BufRead *.re set filetype=c
au BufNewFile,BufRead *.phpt set filetype=php
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.class set filetype=php
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.tpl set filetype=smarty
au BufNewFile,BufRead *.tmpl set filetype=smarty
au BufNewFile,BufRead *.py set filetype=python

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Save last position of cursor
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif

" Persistant Undo
" set undofile
" et undodir=$HOME/vimrc/undo
" et undolevels=1000
" et undoreload=10000

" Highlight extra spaces or tabs in red.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" Because => needs space around it
nmap <silent> <C-i>
			\ :%s/\(['"a-zA-Z]\)=>\(['"a-zA-Z0-9$]\)/\1 => \2/g<CR>
