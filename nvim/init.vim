call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'         " manage csv files
    Plug 'simeji/winresizer'        " <Leader>w to resize panes
    Plug 'simnalamburt/vim-mundo'   " <F5> toggle undo tree
    Plug 'sheerun/vim-polyglot'     " Syntax highl and indentation
    Plug 'preservim/nerdtree'       " File tree
    Plug 'machakann/vim-sandwich'   " sa<motion/txtobj>, sd,sr,sdb,sdr
    Plug 'wellle/targets.vim'       " iX,IX,aX,AX,inX,ilX X=)([],b,.,_,a,q
    Plug 'junegunn/fzf.vim'         " Files, GFiles, Lines
    Plug 'jremmen/vim-ripgrep'      " rg for quickfix window search
    Plug 'stefandtw/quickfix-reflector.vim' " Edit files in quickfix window
    Plug 'machakann/vim-highlightedyank' " Highlights yanks
    Plug 'itchyny/lightline.vim'    " Better status line
    Plug 'jez/vim-superman'         " Read man pages in vim (vman)
    Plug 'tpope/vim-fugitive'       " Git command
    Plug 'mhinz/vim-startify'       " Cooler startup page
"    Plug 'autozimu/LanguageClient-neovim', {
"        \ 'branch': 'next',
"        \ 'tag': '0.1.155',
"        \ 'do': 'bash install.sh',
"        \ }
"    Plug 'ionide/Ionide-vim', {
"          \ 'do':  'make fsautocomplete',
"          \}
"    Plug 'Shougo/deomjplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

let g:sneak#label = 1

" settings for language service
let g:deoplete#enable_at_startup = 1

let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_virtualTextPrefix = ''
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

" enable automatic filetype recognizing and plugin loading
filetype on
filetype plugin on

" autosave
au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif

" use system clipboard
set clipboard+=unnamedplus


" no need for a swapfile these days
set noswapfile

" enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

" see line numbers
" set number

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show substitution
set inccommand=nosplit

" hide a buffer when abandoned instead of unload it
set hidden

augroup filetype_csv
    autocmd!
    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" remapping
map <Space> <Leader>
let g:winresizer_start_key = "<Leader>w"

nnoremap <F5> :MundoToggle<CR>

" s is used by the sandwich plugin
nmap s <Nop>

" can't use arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap <c-w>h <c-w>s

" open a new terminal and pick the file
nmap <Leader><space> :! urxvtc -e bash -i -c "nvim %"<enter><enter>

" PLUGINS

" Higlight time
let g:highlightedyank_highlight_duration = 200

" Set ripgrep to smart casing
let g:rg_command = 'rg --vimgrep -S'

" to remove unnecessary -- INSERT -- given our status bar plugin
set noshowmode
