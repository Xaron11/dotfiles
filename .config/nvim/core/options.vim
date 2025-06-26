" Mapleader
let mapleader = ","

" Status Bar
set statusline=

" Whitespace & Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showtabline=4
set shiftround
set expandtab
set smarttab
set autoindent
set smartindent

" Command Bar
set cmdheight=2
set noshowmode
set history=1000

" Menu
"set wildmode=list:longest
set wildignore=*.jpg,*.png,*.gif,*.pdf
set pumheight=10

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set nojoinspaces
set showmatch

" Number Column
set number
set numberwidth=4
set relativenumber
set signcolumn=yes

" Editor
set textwidth=100
set colorcolumn=100
set scrolloff=4
set sidescrolloff=4
set formatoptions=c,q,r,t

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Split
set splitright
set splitbelow


" Filetypes & Plugins
filetype on
filetype plugin on
filetype indent on

" Theme
syntax on
set termguicolors

" Other
set cursorline
set mouse=a
set updatetime=300
set undofile
set noswapfile
set clipboard=unnamedplus
set nobackup
set nowritebackup
