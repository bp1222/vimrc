" Plugins
call plug#begin('~/vimrc/bundle')
Plug 'zhaocai/GoldenView.Vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'git://github.com/bp1222/jellybeans.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'

" Plugin 'klen/python-mode'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'workiva/frugal'

call plug#end()

" Reset
filetype off
filetype plugin indent on

" Movement
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

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
set number
set numberwidth=5
set foldcolumn=3
set smartindent
set showmatch

" Syntax highlighting
colorscheme challenger_deep
syntax enable

" List
set list
set listchars=tab:>-,trail:-,nbsp:'

" StatusLine
set laststatus=2

" Don't use .swp files
set noswapfile

" Global Python Executable
let g:python2_host_prog = '/opt/homebrew/bin/python2'
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" Golden View
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" Indent Guide
let g:indent_guides_enable_on_vim_startup = 1

" Dart
let dart_html_in_string=v:true

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
au BufNewFile,BufRead *.dart set filetype=dart
au BufNewFile,BufRead *.frugal set filetype=thrift
au BufNewFile,BufRead *.java set filetype=java
au BufNewFile,BufRead *.wsd set filetype=plantuml

" Spacing Settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
autocmd FileType php set expandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
autocmd FileType python set expandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
autocmd FileType go set tabstop=4|set shiftwidth=4|set softtabstop=4
autocmd FileType dart set expandtab
autocmd FileType java set expandtab

" NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
vnoremap <silent> <C-n> :NERDTreeToggle<CR>

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
