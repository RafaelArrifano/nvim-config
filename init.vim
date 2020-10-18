call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'dense-analysis/ale'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
call plug#end()

set termguicolors
colorscheme gruvbox
set backspace=indent,eol,start
set expandtab
set hidden
set nobackup
set nohlsearch
set noswapfile
set nowrap
set number
set shiftwidth=4
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set undodir=~/.vim/undodir
set undofile
set updatetime=50
set wildmenu

autocmd BufEnter * silent! lcd %:p:h
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

tnoremap <ESC> <C-\><C-n><C-w><C-p>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
nnoremap <silent> <leader>ot :sp +ter<CR>

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

tnoremap <ESC> <C-\><C-n><C-w><C-p>
autocmd TermOpen * startinsert
autocmd BufLeave term://* stopinsert
nnoremap <silent> <leader>tt :sp +ter<CR>

let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1

let mapleader = ' '

let g:netrw_banner = 0
nnoremap <silent> <leader>ee :Ex<CR>
nnoremap <silent> <leader>op :e $MYVIMRC<CR>

let g:fzf_preview_window = ''
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap + :vertical resize +5<CR>
nnoremap - :vertical resize -5<CR>
nnoremap <Leader>of :Files<CR>
nnoremap <Leader>r0 :resize 100<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>s :wincmd s<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :bd<CR>
nnoremap Q :q!<CR>
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>y "+y
