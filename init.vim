call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'dense-analysis/ale'
    Plug 'jiangmiao/auto-pairs'
    Plug 'justinmk/vim-sneak'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
call plug#end()

set termguicolors
let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='bg0'
let g:gruvbox_color_column='bg0'
colorscheme gruvbox

set backspace=indent,eol,start
set expandtab
set hidden
set laststatus=0
set nobackup
set nohlsearch
set noswapfile
set nowrap
set number
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

autocmd BufEnter * silent! lcd %:p:h
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

tnoremap <ESC> <C-\><C-n><C-w><C-p>
nnoremap <silent> ' :ter<CR>
autocmd TermOpen * setlocal nonumber norelativenumber

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

autocmd BufWritePre * silent :call TrimWhiteSpace()

let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1

let mapleader = ' '

let g:netrw_banner = 0

nnoremap <silent> <leader>ee :Ex<CR>
nnoremap <silent> <leader>op :e $MYVIMRC<CR>
nnoremap <silent> <leader>t :ter<CR>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :bd!<CR>
nnoremap <silent> <leader>x :%bd<CR>
nnoremap <silent> <leader>X :%bd!<CR>
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
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>u :CtrlPUndo<CR>
nnoremap <silent> <leader>r :CtrlPMRUFiles<CR>
