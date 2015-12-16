"set path=$PWD/**
set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'leafgarland/typescript-vim'
Plugin 'bling/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'groenewege/vim-less'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/gitignore'
Plugin 'mru.vim' " Most recently used
Plugin 'tpope/vim-fugitive'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'docunext/closetag.vim'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'mxw/vim-jsx'
Plugin 'jason0x43/vim-js-indent' " To fix js and ts indenting
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'hdima/python-syntax' " Added python synax highlighting
Plugin 'tfnico/vim-gradle' " Gradle support for building java
Plugin 'derekwyatt/vim-scala' " Scala syntax highlighting and minor features

" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'adlawson/vim-sorcerer'
Plugin 'jordwalke/flatlandia'
Plugin 'romainl/Apprentice'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ajh17/Spacegray.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'

""""""""""" Plugin Options
" Options for xolox/vim-session
let g:session_autosave='yes'
let g:session_default_to_last=1
let g:session_autoload='yes'
" Ctrl P options for kien/ctrlp.vim
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_root_markers=['ctrlp_root.txt']
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore "**/*.swp"
    \ --ignore "**/*.swap"
    \ -g ""'
" Options for jiangmiao/auto-pairs
let g:AutoPairsMapSpace=0
" Options for Valloric/YouCompleteMe
let g:ycm_filetype_specific_completion_to_disable = { 'javascript': 1, 'jsx': 1, 'typescript': 1 , 'python': 1} " Disables syntax completion for file types, so it uses the stuff in my buffers instead
" Options for jason0x43/vim-js-indent
let g:js_indent_typescript=1
" Options for leafgarland/typescript-vim
let g:typescript_indent_disable=1
" Options for ntpeters/vim-better-whitespace
autocmd VimEnter * :ToggleStripWhitespaceOnSave
autocmd VimEnter * :ToggleWhitespace
let g:better_whitespace_filetypes_blacklist=['markdown'] " don't strip whitespace of these file types
" Options for nathanaelkane/vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  guibg=#3C3836 ctermbg=3
autocmd VimEnter,Colorscheme * hi IndentGuidesEven guibg=#3C3836 ctermbg=4
" Ag options
let g:AgSmartCase=1
" Options for morhetz/gruvbox
let g:gruvbox_bold=0
" Options for python-syntax
let python_highlight_all=1 " Turn all on, then turn off specific ones below
let python_highlight_space_errors=0 " Do not highlight space_errors (trailing whitespace, really) in python
""""""""""" End Plugin Options
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""" Editing Options
set hlsearch
set splitright " open all new splits on the right instead of left
set hidden
set laststatus=2
set statusline+=%f%{fugitive#statusline()}
" Tab options
let g:myTabSize = 4 " Set myTabSize var to use below
let &shiftwidth = myTabSize " Tell vim how many columns is a tab
let &softtabstop = myTabSize " Tab and delete this many columns
let &tabstop = myTabSize " Actual hard tabstops will be my tab size
set expandtab " Make tabs be spaces
set autoread " Always reload a file when it has changed instead of asking
set autoindent
set number " Line numbers
set mouse=a " Allow mouse scrolling, other mouse events
set t_Co=256
set ignorecase
set smartcase " Smartcase in search
set cursorline " Show current line highlighted
set incsearch
set nowrap
set tags=tags; " Tell vim to look for tags recursively downwords
set nostartofline " Keeps the cursor in its last spot when changing buffers (prevents it from going to start of line)


""""""""""" View options
set guifont=Menlo:h12 " Font size; atom uses h14
set linespace=4 " Line space; atom uses 5
syntax on
set background=dark
" Options for jellybeans
let g:jellybeans_overrides = {
\    'Normal': { 'guifg': 'DBDBC3'},
\    'CursorLine': { 'guibg': '2B2B2B' },
\}
colorscheme gruvbox
"Override background to force black
"autocmd VimEnter,Colorscheme * hi Normal guibg=#0D0D0D " Set background color to almost-black
"autocmd VimEnter,Colorscheme * hi LineNr guibg=#0D0D0D " Set line number background
"autocmd VimEnter,Colorscheme * hi SignColumn guibg=#0D0D0D " Set gutter background
"Markdown syntax finding
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Spell checking options
autocmd BufRead,BufNewFile *.md setlocal spell "Auto turn on spellcheck for .md files
autocmd BufRead,BufNewFile hi clear SpellCap "Turn off capitalization spellcheck highlighting

""""""""""" Key mappings
let mapleader=","
nnoremap <leader>r :CtrlPMRU<cr>
nnoremap <leader>m :CtrlPMixed<cr>
nnoremap <leader>v :CtrlPBuffer<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Map j and k to gj, gk, which move one line in wrapped text
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" End mapping j and k
nnoremap <C-\> :NERDTreeToggle<cr>
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

""""""""""" Custom Commands
command Bd 1,1000bd
command Writing set wrap linebreak nolist columns=85 nocursorline nonumber

" F10 reveals the syntax highlighting on a specific character
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
