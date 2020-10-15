call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'dense-analysis/ale'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-sensible'
call plug#end()

" Misc
set termguicolors
colorscheme gruvbox
set number

" Tab comum
set backspace=indent,eol,start
set expandtab

" Converte tab em espaços
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Clipboard da DE
set clipboard=unnamedplus

set hidden

" Sem Highlight no search
set nohlsearch

" Sem quebra de linha
set nowrap

set updatetime=300
set wildmenu

set splitbelow
set splitright

" Auto workdir
autocmd BufEnter * silent! lcd %:p:h

" Auto sourcing
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Coc Backspace
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Coc Tab
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Terminal
tnoremap <ESC> <C-\><C-n><C-w><C-p>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* exit
nnoremap <silent> <leader>ot :sp +ter<CR>

" Linters
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1

" Leader
let mapleader = ' '

" Ex
let g:netrw_banner = 0
nnoremap <silent> <leader>ee :Ex<CR>

" init.vim
nnoremap <silent> <leader>pp :e $MYVIMRC<CR>

" Fzf
let g:fzf_preview_window = ''
nnoremap <silent> <leader>f. :Files .<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>bb :Buffers<CR>

" Buffers
nnoremap <silent> <leader>qq :bwipeout!<CR>
nnoremap <silent> <leader>nn :enew<CR>

" Window
nnoremap <silent> <leader>w <C-w>

" Salvar
nnoremap <silent> <leader>ss :w<CR>

" Navegação
nnoremap <silent> <leader>k <C-b>
nnoremap <silent> <leader>j <C-f>

" Esc
inoremap <silent> qq <ESC>

" Sort
vnoremap <silent> qs :'<,'>sort<CR>

" Visual
nnoremap <silent> <leader>v <C-v>
