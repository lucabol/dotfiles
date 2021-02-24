call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
"    Plug 'jwilm/i3-vim-focus'
call plug#end()

set clipboard+=unnamedplus

map <Space> <Leader>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap <c-w>h <c-w>s

" trying to use https://github.com/jwilm/i3-vim-focus, but failed
" map gwl :call Focus('right', 'l')<CR>
" map gwh :call Focus('left', 'h')<CR>
" map gwk :call Focus('up', 'k')<CR>
" map gwj :call Focus('down', 'j')<CR>

set noswapfile

" save undo trees in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

set number

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show substitution
set inccommand=nosplit

set hidden

augroup filetype_csv
    autocmd!
    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

let g:winresizer_start_key = "<leader>w"

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
