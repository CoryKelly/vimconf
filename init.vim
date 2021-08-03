"----------------------------------------------------------------------------
"     - Default settings -
" ----------------------------------------------------------------------------
set nocompatible
set tabstop=4 softtabstop=4
set shiftwidth=4
set exrc
set relativenumber
set guicursor
set nohlsearch
set hidden
set noerrorbells
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set scrolloff=8
set termguicolors
set noshowmode
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set expandtab
set autoindent
set smartindent
set number
filetype off
syntax on

"Give more space for diplaying messages
set cmdheight=2


" ----------------------------------------------------------------------------
"     - Plugin -
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'tpope/vim-fugitive'

call plug#end()



" ----------------------------------------------------------------------------
"     - Colours -
" ----------------------------------------------------------------------------
colorscheme onedark
