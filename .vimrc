" Plugins
call plug#begin('~/vimrc/bundle')
Plug 'zhaocai/GoldenView.Vim'
Plug 'git://github.com/bp1222/jellybeans.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'

" Plugin 'klen/python-mode'
Plug 'solarnz/thrift.vim'
Plug 'dart-lang/dart-vim-plugin'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java'}
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'ctrlpvim/ctrlp.vim'

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
let g:jellybeans_overrides = {
      \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}
colorscheme jellybeans
syntax on

" List
set list
set listchars=tab:>-,trail:-,nbsp:'

" Spacing Settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

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

" NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
vnoremap <silent> <C-n> :NERDTreeToggle<CR>

"Ctrlp Settings {{{
let g:ctrlp_map = '<c-p>'

let g:ctrlp_cmd = 'ctrlp'
let g:ctrlp_dont_split = 'nerd'
let g:ctrlp_working_path_mode = 'rw'
set wildignore+=*/.git/*,*/tmp/*,*.swp/*,*/node_modules/*,*/temp/*,*/Builds/*,*/ProjectSettings/*
let g:ctrlp_max_files = 0

function! CtrlPCommand()
  let c = 0
  let wincount = winnr('$')
  " Don't open it here if current buffer is not writable (e.g. NERDTree)
  while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
    exec 'wincmd w'
    let c = c + 1
  endwhile
  exec 'CtrlP'
endfunction
let g:ctrlp_cmd = 'call CtrlPCommand()'

let g:ctrlp_custom_ignore = {
      \ 'dir':  '',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.meta|\.zip|\.rar|\.ipa|\.apk',
      \ }
" }}}

"Ale Settings {{{
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'
let g:ale_open_list = 0
let g:ale_loclist = 0
"g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac']
      \ }
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#sources = {}
let g:deoplete#sources._=['buffer', 'file', 'dictionary']
let g:deoplete#sources.javascript = ['tern', 'omni', 'file', 'buffer']

" Use smartcase.
let g:deoplete#enable_smart_case = 1

""use TAB as the mapping
inoremap <silent><expr> <TAB>
      \ pumvisible() ?  "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}
" }}}

" Java {{{
" Easy compile java in vim
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#
" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
" }}}
