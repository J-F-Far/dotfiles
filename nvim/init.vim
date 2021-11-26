
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

" Make yank behave like C, D, etc 
nnoremap Y y$

" Keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo Breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <C-O>:m .+1<CR><C-O>==
inoremap <C-k> <C-O>:m .-2<CR><C-O>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Move in Splits
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

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

" plugins
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
Plug 'nvim-treesitter/playground'
" nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

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

" nvim-cmp config
set completeopt=menu,menuone,noselect

" lua <<EOF
"   -- Setup nvim-cmp.
"   local cmp = require'cmp'
" 
"   cmp.setup({
"     snippet = {
"       expand = function(args)
"         -- For `vsnip` user.
"         vim.fn["vsnip#anonymous"](args.body)
" 
"         -- For `luasnip` user.
"         -- require('luasnip').lsp_expand(args.body)
" 
"         -- For `ultisnips` user.
"         -- vim.fn["UltiSnips#Anon"](args.body)
"       end,
"     },
"     mapping = {
"       ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"       ['<C-f>'] = cmp.mapping.scroll_docs(4),
"       ['<C-Space>'] = cmp.mapping.complete(),
"       ['<C-e>'] = cmp.mapping.close(),
"       ['<CR>'] = cmp.mapping.confirm({ select = true }),
"     },
"     sources = {
"       { name = 'nvim_lsp' },
" 
"       -- For vsnip user.
"       { name = 'vsnip' },
" 
"       -- For luasnip user.
"       -- { name = 'luasnip' },
" 
"       -- For ultisnips user.
"       -- { name = 'ultisnips' },
" 
"       { name = 'buffer' },
"     }
"   })
" 
"   -- Setup lspconfig.
"   require('lspconfig')[%YOUR_LSP_SERVER%].setup {
"     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
"   }
" EOF
