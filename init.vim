"----------------------------------------------------------------------------
"     - Default settings -
" ----------------------------------------------------------------------------
set nocompatible
set conceallevel=3
filetype plugin on
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
set encoding=UTF-8

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Give more space for diplaying messages
set cmdheight=2

" Icons for Startify
let g:webdevicons_enable_startify = 1

" Turn off brackets for NERDTree
let g:webdevicons_conceal_nerdtree_brackets = 1

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Quit NERDTree when opening files
let NERDTreeQuitOnOpen=1
let g:NERDTreeFileExtensionHighlightFullName = 1

let g:NERDTreeFileExtensionHighlightFullName = 0
let g:NERDTreeExactMatchHighlightFullName = 0
let g:NERDTreePatternMatchHighlightFullName = 0

" Show hidden files
let NERDTreeShowHidden=1

"Setting Go bin path
let g:go_bin_path = $HOME."/go/bin"

" Mapped Leader Key to space
let mapleader = " "




" ----------------------------------------------------------------------------
"         - Plugins -
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" telescope requirements
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Nerd Tree 
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Startify fancy start screen
Plug 'mhinz/vim-startify', {'branch': 'center'}

" Color Theme 
Plug 'dracula/vim'

" Golang Support 
Plug 'fatih/vim-go'

" Github Support 
Plug 'tpope/vim-fugitive'

" Syntax highlight support 
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Personal Wiki 
Plug 'vimwiki/vimwiki'

" Statusline config
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

call plug#end()


" ----------------------------------------------------------------------------
"     - Colours -
" ----------------------------------------------------------------------------
colorscheme dracula


" ----------------------------------------------------------------------------
"     - Splash Screen config -
" ----------------------------------------------------------------------------
let s:header= [
\ "                          ",
\ "                          ",
\ "                          ",
\ "      .            .      ",
\ "    .,;'           :,.    ",
\ "  .,;;;,,.         ccc;.  ",
\ ".;c::::,,,'        ccccc: ",
\ ".::cc::,,,,,.      cccccc.",
\ ".cccccc;;;;;;'     llllll.",
\ ".cccccc.,;;;;;;.   llllll.",
\ ".cccccc  ';;;;;;'  oooooo.",
\ "'lllllc   .;;;;;;;.oooooo'",
\ "'lllllc     ,::::::looooo'",
\ "'llllll      .:::::lloddd'",
\ ".looool       .;::coooodo.",
\ "  .cool         'ccoooc.  ",
\ "    .co          .:o:.    ",
\ "      .           .'      ",
\ "                          ",
\ "                          ",
\ "                          ",
\ "                          ",
\ "                          ",
\ "                          ",
\]

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': startify#center(['  Bookmarks']) },
      \ { 'type': 'files',     'header': startify#center(['  Recent Files']) },
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.config/nvim/init.vim' },
      \ { 'z': '~/.work_projects'},
      \ { 'c': '~/personal_projects'},
      \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_center = 60
let g:startify_custom_header = s:center(s:header)
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

" next greatest remap ever
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" create new vertical split window
nnoremap <leader>. :vnew <cr>



" --------------------------------------------------------------------------
"      - Telescope -
" --------------------------------------------------------------------------
" Telescope Import 
lua require('telescope_setup')

" Telescope icons
lua require'nvim-web-devicons'.get_icons()
nnoremap <C-q> <cmd>lua require("telescope_setup").curr_buf() <cr>

" --------------------------------------------------------------------------
"     - coc.nvim default settings -
" --------------------------------------------------------------------------
"
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

" Statusline Custom Config 
lua require('statusline')

" Simpler Solution for window changing
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" Vim Wiki Syntax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Yank highlight 
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
let g:WebDevIconsDefaultFileSymbolColor = s:blue
