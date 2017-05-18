" ------------------------------------
"  Name: My Vimrc
"  Author: Wang Daoyuan
"  Email: distant-road@hotmail.com
" ------------------------------------

" 插件 {{{
filetype off
set nocompatible

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

"My bundles:

" 几个配色方案
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'jnurmine/Zenburn'

" Powerline增强显示效果
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" SimpylFold增强折叠代码块的功能
Plugin 'tmhedberg/SimpylFold'

" NERDTree增加目录树
Plugin 'scrooloose/nerdtree'

" 代码块管理
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" NERDCommenter增加通用的注释功能
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tell-k/vim-autopep8'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'dyng/ctrlsf.vim'


" 括号自动补全
Plugin 'Raimondi/delimitMate'
" 增加Indent文本对象
Plugin 'michaeljsmith/vim-indent-object'

Plugin 'nelstrom/vim-markdown-folding'

" 显示Python文件中的IndentLine
Plugin 'Yggdroot/indentLine'

" RopeVim重构工具
Plugin 'python-rope/ropevim'

let g:Powerline_colorscheme='solarized256'
let python_highlight_all=1

" Syntastic基本配置
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_python_checkers=["pylint"]
"}}}

" 通用配置 {{{
set history=1000
set ruler
"set relativenumber
set number
set showcmd
set showmode
set laststatus=2
set cmdheight=2
set scrolloff=3
set foldcolumn=3

set wildmenu
set wildmode=longest:full,full
set splitbelow

"Fill space between windows
"set fillchars=stlnc:\\,vert:\|

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
set shortmess=I

"syntax and theme
syntax on
set cursorline
set cursorcolumn
set background=dark
colorscheme solarized
"colorscheme industry

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
"set autochdir
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

" 键盘映射 {{{
let mapleader=","
nnoremap <space> za

nnoremap <leader>e :e! ~/.vimrc<cr>

augroup ft_python
  au!
  au FileType python nnoremap <leader>r :w<cr>:!python3 %<cr>
  au FileType python nnoremap <leader>f m0:Autopep8<cr>`0m0
augroup END
" 移动分割窗口
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end> 

map <F5> :NERDTreeToggle<cr>

" 更改配置后自动加载新配置
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"}}}

" 配置插件 {{{

let g:SimpylFold_docstring_preview = 1
let g:ycm_autoclose_preview_window_after_completion=0

let g:ycm_add_preview_to_completeopt = 1
"语言关键字补全,不过python关键字都很短，所以，需要的自己打开
let g:ycm_python_binary_path='python3'
let g:ycm_seed_identifiers_with_syntax=1   
let g:ycm_complete_in_comments = 0
" 不显示文档窗口
"set completeopt-=preview
"let g:ycm_add_preview_to_completeopt=0
let g:ycm_complete_in_strings = 0
let g:ycm_min_num_of_chars_for_completion=99
let g:ycm_key_invoke_completion = '<C-x>'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,perl6,scala,vb,elixir,go' : ['.'],
  \   'python' : ['re!.*'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_use_ultisnips_completer = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap <leader>d :YcmCompleter GetDoc<cr>

" 解决UltiSnips与YCM插件的冲突
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "/Users/wang/UltiSnips"
let g:UltiSnipsSnippetDirectories=["/Users/wang/UltiSnips"]
nnoremap <silent> <F9> :TagbarToggle<CR>
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

augroup ft_vim
  au!
  au FileType vim setlocal foldmethod=marker
augroup END
" 以下代码解决插入模式下光标移动问题
if &term[:4]=="xterm" || &term[:5] == "screen" || &term[:3]=="rxvt"
    inoremap <silent> <C-[>OC <right>
endif
" "}}}

