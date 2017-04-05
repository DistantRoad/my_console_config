" ------------------------------------
"  Name: My Vimrc
"  Author: Wang Daoyuan
"  Email: distant - road@hotmail.com
" ------------------------------------


" 插件 {{{
filetype off
set nocompatible

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
"Let vundle manage vundle, required
Plugin 'gmarik/vundle'

"My bundles:     " 几个配色方案
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'jnurmine/Zenburn'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tell-k/vim-autopep8'
Plugin 'majutsushi/tagbar'
Plugin 'python-rope/ropevim.git'
"}}}

" General {{{
set history=1000
set ruler
set relativenumber
set number
set showcmd
set showmode
set laststatus=2
set cmdheight=2
set scrolloff=3

"Fill space between windows
"set fillchars=stl:,stlnc:\,vert:

" 禁止光标闪烁
"set gcra:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

"Turn off splash screen
set shortmess=atI

"syntax and theme
syntax on
set cursorline
set cursorcolumn
set background=dark
colorscheme zenburn
"colorscheme solarized

"Configure backspace to be able to cross to lines
set backspace=2
set whichwrap+=<,>,h,l

"Tab and indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set cindent

"Files, backups and encoding
set nobackup
set noswapfile
set autoread
set autowrite
set autochdir
set fileencodings=utf-8
set fileformats=unix,dos,mac
filetype plugin on
filetype indent on

"Text search and replace
set showmatch
set matchtime=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set magic
set lazyredraw
set nowrapscan
set iskeyword+=_,$,@,%,#,-,.
set wildmode=full

" Set python folding
set foldmethod=indent
set foldlevel=99

" 设置使用鼠标
set mouse=a

" 光标使用屏幕行
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 使用jk键返回
inoremap jk <esc>
inoremap <esc> <nop>
"}}}


" Keymap {{{
let mapleader=","
nnoremap <c-s> :w<cr>
nnoremap <space> za

nnoremap <leader>s :source ~/.vimrc<cr>
nnoremap <leader>e :vsplit ~/.vimrc<cr>

nnoremap <leader>r :w<cr>:!python3 %<cr>
" 移动分割窗口
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end> 

map <F5> :NERDTreeToggle<cr>
"}}}


" 配置YCM - - 实验阶段

"let g: SimpylFold_docstring_preview1
"let g: ycm_autoclose_preview_window_after_completion0
let g:ycm_python_binary_path='python3'
"nnoremap < leader > g: YcmCompleter GoToDefinitionElseDeclaration < cr >
"nnoremap < leader > d: YcmCompleter GetDoc < cr >

" 配置Jedi
"let g:jedi  # force_py_version2

" Config Autopep8 {{{    " Do not fix these errors / warnings(default: E226, E24, W6)
" let g:autopep8_ignore="E501, W293"

" Fix only these errors / warnings(e.g. E4, W)
" let g:autopep8_select="E501, W293"

" Maximum number of additional pep8 passes(default: 100)
" let g: autopep8_pep8_passes100

" Set maximum allowed line length(default: 79)
" let g: autopep8_max_line_length79

" Enable possibly unsafe changes(E711, E712)(default: non defined)
let g:autopep8_aggressive=1

" Number of spaces per indent level(default: 4)
" let g: autopep8_indent_size2

" Disable show diff window
let g:autopep8_disable_show_diff=1

"augroup autopep8:
"autocmd!
"autocmd BufWritePre *.py :Autopep
"augroup END

"}}}


" 杂项 {{{
filetype indent plugin on

augroup ft_vim
  au!
  au FileType vim setlocal foldmethod=marker
augroup END
" "}}}
