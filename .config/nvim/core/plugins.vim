call plug#begin()

" Themes
" Plug 'fneu/breezy'
Plug 'EdenEast/nightfox.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasiser/vim-code-dark'
"

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Commenter
Plug 'preservim/nerdcommenter'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tabbar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', {'tag' : '0.1.4'}

" Terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" Linter
Plug 'dense-analysis/ale'

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" File Tree
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'

" C#
Plug 'OmniSharp/omnisharp-vim'

" Other
Plug 'jiangmiao/auto-pairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'psliwka/vim-smoothie'

call plug#end()
