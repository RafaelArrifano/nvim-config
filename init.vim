call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'dense-analysis/ale'
    Plug 'jiangmiao/auto-pairs'
    Plug 'justinmk/vim-sneak'
    Plug 'mattn/emmet-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sainnhe/gruvbox-material'
    Plug 'sheerun/vim-polyglot'
call plug#end()

set background=dark
set termguicolors
let g:gruvbox_material_palette='original'
let g:gruvbox_material_background='medium'
let g:gruvbox_material_transparent_background=1

colorscheme gruvbox-material

set backspace=indent,eol,start
set expandtab
set hidden
set laststatus=1
set nobackup
set nohlsearch
set noswapfile
set nowrap
set relativenumber
set nu
set shiftwidth=4
set softtabstop=4
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set updatetime=50
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
set mousemodel=popup

autocmd BufEnter * silent! lcd %:p:h
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

tnoremap <ESC> <C-\><C-n><C-w><C-p>
nnoremap <silent> ' :ter<CR>
autocmd TermOpen * setlocal nonumber norelativenumber

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1

let mapleader = ' '

let g:netrw_banner = 0
let g:netrw_gh = 0

let g:netrw_list_hide = '^\..*'
let g:netrw_hide = 1

nnoremap <silent> <leader>ee :Ex<CR>
nnoremap <silent> <leader>op :e $MYVIMRC<CR>
nnoremap <silent> <leader>t :ter<CR>

nnoremap <silent> <leader>w :w<CR>
" nnoremap <silent> <leader>Q :q<CR>
nnoremap <silent> <leader>q :q!<CR>
" nnoremap <silent> <leader>x :%bd<CR>
nnoremap <silent> <leader>x :%bd!<CR>
nnoremap <silent> <leader>s :wincmd s<CR>
nnoremap <silent> <leader>v :wincmd v<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>/ :wincmd r<CR>
nnoremap <silent> <leader>n :bNext<CR>
nnoremap <silent> <Leader>0 :resize 100<CR>

nnoremap <silent> <leader>p "+p
nnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>p "+p
vnoremap <silent> <leader>y "+y

nnoremap <silent> <leader>. :CtrlP ~/Documentos/Projetos<CR>
nnoremap <silent> <leader>; :CtrlP ~<CR>
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>u :CtrlPUndo<CR>
nnoremap <silent> <leader>r :CtrlPMRUFiles<CR>
