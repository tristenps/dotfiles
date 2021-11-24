syntax enable
filetype plugin on

set guicursor=i:ver25-iCursor
set hidden
set noerrorbells
set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
"set smartindent
set autoindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set noshowmode
set cursorline
set autochdir

" Time before Vim allows the plugin's to run
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Installs vim-plug if it does not exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install missing plugins on launch
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin("~/.vim/plugged")
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'edkolev/tmuxline.vim'
Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Huh
lua require 'nvim-treesitter.configs'.setup {highlight = {enable=true}}

" Plugin Configs
colorscheme gruvbox
set background=dark

" Sets Leader Key to Space
let mapleader = " "

" Testing Which Key
set timeoutlen=300
let g:which_key_timeout = 300
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"nnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>

" No line numbers in NVIM Terminal
autocmd TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>

let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Window Hopping
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

" Window Creation
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ws :split<CR>

" Window Closing
nnoremap <leader>wc :clo<CR>
nnoremap <leader>bd :bd<CR>

" UndoTree
nnoremap <leader>u :UndotreeShow<CR>
"
" File Explorer Shortcut
nnoremap <leader>pv :wincmd v<bar> :Ex <bar>  :vertical resize 20<CR>

" Remap Up and down for Popoups
" May want to remove when getting used to tmux ?
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Jump to Definition - coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

"Get into files quickly with Telescope
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-g> :Telescope git_files<CR>
nnoremap <C-o> :Telescope buffers<CR>
