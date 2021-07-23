
syntax on

let mapleader = " "

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set nowrap
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile
set incsearch
set splitright
set scrolloff=8

set colorcolumn=80
set signcolumn=yes

highlight ColorColumn ctermbg=0 guibg=lightgrey

" Remap <Esc> to jj to make it easier to re-enter command mode
inoremap jj <Esc>

" Move in Splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>pv :vertical topleft split <bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Open NetRW files in vertical split
let g:netrw_winsize = 25
let g:netrw_browse_split = 3

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'google/vim-jsonnet'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim', { 'branch': 'async_jobs_v2' }
Plug 'nvim-telescope/telescope.nvim', { 'branch': 'async_v2' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Initialize plugin system
call plug#end()

" vim-fugitive remaps
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox
set background=dark

" yank and paste to clipboard registers with leader key
vmap <leader>y "*y
nmap <leader>p "*p

" Include Lua config
lua require('config')

" Set Python3 interpreter
let g:python3_host_prog = '/home/joel/.venv/py3nvim/bin/python'

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

