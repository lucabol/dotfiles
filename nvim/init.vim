" COLOR SCHEME {{{1
set termguicolors

" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined
" or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
" Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
" text output by commands like `ls` aren't what you expect, you might want to
" try disabling this option. Default value:
let g:neosolarized_termBoldAsBright = 1

colorscheme NeoSolarized
set background=light

" STANDARD KEY MAPPINGS AND COMMANDS {{{1
let mapleader = "<SPACE>"

" Highlight line where the cursor is. You could also highlight just the
" numbers on the left.
set cursorline

" Enable mouse in all scenarios. Remember that right click extends selection.
set mouse=a

" Enable autowrite when leaving a buffer in various ways.
set autowriteall

" Shows the number the line is on as absolute, but the rest is relative.
" It is better for motion commands, but likely worse for Ex cmds.
set number
set relativenumber

" If terminal supports it, set the icon for the file (also
" see iconstring). 'st', 'urxvt' and 'xterm' doesn't seem to work ...
set icon

" Enable setting the title for the window (but some terminal don't allow
" resetting it back to the previous value. I.E. 'st' doesn't)
set title
set titlestring=%f%(\ %M%)

" Always use spaces for tabs.
set expandtab

" Set tab length.
set tabstop=2
set shiftwidth=2

" If a search term has uppercase chars, do a case sensitive search. Otherwise
" use a case insensitive one.
set ignorecase
set smartcase

" Set search for tabs to follow ignorecase and smartcase
set tagcase=followscs

" Tries to automatically indent lines at best it can
set autoindent
set smartindent

" From the manual, turns off hlsearch after finished searching. There are also
" plugins that do this in case it doesn't work quite right.
augroup vimrc-incsearch-highlight
        autocmd!
        autocmd CmdlineEnter /,\? :set hlsearch
        autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Custom statusline {{{2
" Inspired by: https://shapeshed.com/vim-statuslines/
" + https://gist.github.com/bla-rs/c439daa0aaa5dea899056bc0b7d34ead
function! MyFugitive()
    let _ = fugitive#head()
    if exists("g:gitstatus")
        if g:gitstatus == "M"
            return strlen(_) ? " 擪  "._ : ""
        else
            return strlen(_) ? " 㑽  "._ : ""
        endif
    else
        return
    endif
endfunction

function! GetGitStatus()
    let gitoutput = systemlist('cd '.expand('%:p:h:S').' && git status --porcelain -b 2>/dev/null | grep M')
    if len(gitoutput) > 0
        let g:gitstatus = "M"
    else
        let g:gitstatus = ""
    endif
endfunc

autocmd BufEnter,BufWritePost * call GetGitStatus()

set statusline=
set statusline+=%f
set statusline+=\ %([%{g:gitstatus}]%)\ 
set statusline+=%m\ 
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" PROGRAMMING IDE {{{1

" Automatically regenerate tags file on save. This runs for any file, even not
" programming ones, which is a bit wasteful. Could specify *.rs, *.cs, etc...
au BufWritePost * silent! !ctags -R &

" Enables Omni completion
filetype plugin on

" If a plugin has not set an omnifunc use the syntax completion file to
" provide a poor man omni completion.
if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
                \ if &omnifunc == "" |
                        \ setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
        endif

" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" Change completeopt so that completion doesn't select the first, but inserts
" the longest and menu comes up even if just one match.
let completeopt="longest,menuone"

" When popup is visible Enter selects the highlighted menu item.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Simulates down key when popup appears, keeping the menu alive while you
" type.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') . '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" RUST {{{1
" Set make to cargo instead of the useless default of rustc from the rust.vim
" default plugin.
autocmd FileType rust compiler! cargo
" BUGS {{{1

" gx to open a browser got broken, this works just for linux, trivially change
" for windows. https://github.com/vim/vim/issues/4738 
nmap gx yiW:!xdg-open <cWORD><CR> <C-r>" & <CR><CR>


" VIM MODELINES {{{1
" vim: fdm=marker:
