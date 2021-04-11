call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'altercation/vim-colors-solarized'
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
    Plug 'takac/vim-hardtime'       " can't press hjklupdownleftright twice in 1 second.
    Plug 'ervandew/supertab'        " enable tab in many scenarios
    "   Rust language support
    " autocomplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " Language Server Client
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
    let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ }

    " For improved UI
    Plug 'junegunn/fzf'
    Plug 'rust-lang/rust.vim',         { 'for': 'rust' }

call plug#end()

let g:lightline = { 'colorscheme': 'solarized'}
"16 colors for vim
set t_Co=16
set background=dark
colorscheme solarized 

" F5 toggle to dark mode
call togglebg#map("<F5>")

" grey line numbers
" hi LineNr ctermfg=8
" hi CursorLineNr ctermfg=8 ctermbg=252

" Hardtime is on, baby, stop jkl;
let g:hardtime_default_on = 1

" avoid matching parenthesis to be too similar in color
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" settings for language service
let g:deoplete#enable_at_startup = 1

" deoplete source around cursor for completion words
call deoplete#custom#var('around', {
\   'range_above': 15,
\   'range_below': 15,
\   'mark_above': '[↑]',
\   'mark_below': '[↓]',
\   'mark_changes': '[*]',
\})

" enable automatic filetype recognizing and plugin loading
filetype on
filetype plugin on

" Rust settings
nmap <F6> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> <F2> <Plug>(lcn-rename)
autocmd FileType rust nmap <silent> gr <Plug>(lcn-rename)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)

" Configure Rust formatter https://github.com/rust-lang/rust.vim#formatting-with-rustfmt
autocmd Filetype rust nnoremap == :RustFmt<CR>
let g:rustfmt_autosave = 1


let g:sneak#label = 1

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

" see hybrid line numbers
set number relativenumber

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line
" don't wrap lines

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap

" cursor line and column line
set cursorline
set colorcolumn=80

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

nnoremap <F7> :MundoToggle<CR>

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

" Deoplete mappings
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" PLUGINS

" Higlight time
let g:highlightedyank_highlight_duration = 200

" Set ripgrep to smart casing
let g:rg_command = 'rg --vimgrep -S'

" to remove unnecessary -- INSERT -- given our status bar plugin
set noshowmode
