"----------------------------------------------------------------------------
"     - Default settings -
" ----------------------------------------------------------------------------
set nocompatible
set tabstop=2 softtabstop=2
set shiftwidth=2
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

" Quit NERDTree when opening files
let NERDTreeQuitOnOpen=1

" Show hidden files
let NERDTreeShowHidden=1

"Setting Go bin path
let g:go_bin_path = $HOME."/go/bin"

" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"Plug 'fannheyward/telescope-coc.nvim'

call plug#end()

" ----------------------------------------------------------------------------
"     - Colours -
" ----------------------------------------------------------------------------
colorscheme dracula

" ----------------------------------------------------------------------------
"     - Remapping - 
" ----------------------------------------------------------------------------
map <silent> <C-n> :NERDTreeFocus<CR>

" find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" edit and source 
nnoremap <leader>ev <cmd>vsp $MYVIMRC<cr>
nnoremap <leader>sv <cmd>source $MYVIMRC<cr>

" Quickfix list for cNext cPrevious
map <C-j> :cn<CR>
map <C-k> :cp<CR>
" ----------------------------------------------------------------------------
"     - Custom telescope - 
" ----------------------------------------------------------------------------
lua << EOF
require('telescope').setup{
    defaults = {
        prompt_prefix = " 🔍 "
        },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF

" -------------------------------------------------------------------------------------------------
"     - coc.nvim default settings -
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
