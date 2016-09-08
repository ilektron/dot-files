"set path=$PWD/**
set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" File browser
Plugin 'scrooloose/nerdtree'
" Support for mappings to comment code
Plugin 'scrooloose/nerdcommenter'
" Editor session support
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
" Plugin for finding stuff
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin to show which lines have changed
Plugin 'airblade/vim-gitgutter'
" Menu bar at bottom... not working for some reason
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Automatically create matching brackets, parens, quotes, etc...
Plugin 'jiangmiao/auto-pairs'
" Allows creating multiple cursors for editing multiple locations
Plugin 'terryma/vim-multiple-cursors'
" Adds git ignore to search ignore
Plugin 'vim-scripts/gitignore'
" Most recently used
Plugin 'mru.vim'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Causes tailing whitespace to be highlighted
Plugin 'ntpeters/vim-better-whitespace'
" HTML + inline SVG omnicomplete function, indent and syntax for Vim
Plugin 'othree/html5.vim'
" Javascript support
Plugin 'pangloss/vim-javascript'
Plugin 'mileszs/ack.vim'
Plugin 'docunext/closetag.vim'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'jason0x43/vim-js-indent' " To fix js and ts indenting
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chase/vim-ansible-yaml'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'fatih/vim-go' " Support for golang
Plugin 'klen/python-mode' " lots o' python stuff for vim
Plugin 'joonty/vdebug.git' " debugger for multiple languages
Plugin 'nginx.vim' " Add nginx syntax highlighting
Plugin 'saltstack/salt-vim' " Add syntax highlighting for salt
Plugin 'vim-scripts/taglist.vim' " tag browser that supports multiple languages

" Color schemes
Plugin 'morhetz/gruvbox'
" Plugin 'chriskempson/base16-vim'
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

" " Options for xolox/vim-session
" let g:session_autosave='yes'
" let g:session_default_to_last=1
" let g:session_autoload='yes'
" Options for bling/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Ctrl P options for kien/ctrlp.vim
let g:ctrlp_show_hidden=1
let g:ctrlp_by_filename=1 " default to only matching filenames in ctrlp
let g:ctrlp_working_path_mode = 'wa' " hard to explain, read docs
let g:ctrlp_root_markers=['ctrlp_root.txt']
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore "**/*.swp"
    \ --ignore "**/*.swap"
    \ --ignore "CustomerWebApp/*"
    \ --ignore "pingfederate/*"
    \ --ignore "bemuse/*"
    \ --ignore "video/*"
    \ --ignore "vivint-toys/*"
    \ -g ""'
" Options for jiangmiao/auto-pairs
let g:AutoPairsMapSpace=0
" Options for Valloric/YouCompleteMe
" let g:ycm_filetype_specific_completion_to_disable = { 'javascript': 1, 'jsx': 1, 'typescript': 1 , 'python': 1} " Disables syntax completion for file types, so it uses the stuff in my buffers instead
let g:ycm_filetype_specific_completion_to_disable = { 'javascript': 1, 'jsx': 1, 'typescript': 1 } " Disables syntax completion for file types, so it uses the stuff in my buffers instead
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
" Options for jason0x43/vim-js-indent
let g:js_indent_typescript=1
" Options for ntpeters/vim-better-whitespace
autocmd VimEnter * :ToggleStripWhitespaceOnSave
autocmd VimEnter * :ToggleWhitespace
let g:better_whitespace_filetypes_blacklist=['markdown'] " don't strip whitespace of these file types
" Options for nathanaelkane/vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  guibg=#3C3836 ctermbg=3
autocmd VimEnter,Colorscheme * hi IndentGuidesEven guibg=#3C3836 ctermbg=4
" Options for python-mode
let g:pymode_folding=0
let g:pymode_lint=0
let g:pymode_lint_on_write=0
let g:pymode_rope=0
let g:pymode_breakpoint_bind='<leader>b'
let g:pymode_run=0
let g:pymode_options_colorcolumn=0
let g:pymode_syntax_space_errors=0
let g:pymode_trim_whitespaces=0
let g:pymode_options_max_line_length=120

" Options for milesza/ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
""""""""""" End Plugin Options
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""" Neovim specific options
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True colors by default
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

""""""""""" Editing Options
" set clipboard=unnamedplus " put all yanked stuff into sytem clipboard
set hlsearch
" set splitright " open all new splits on the right instead of left
set hidden
set laststatus=2
set statusline+=%f%{fugitive#statusline()}
" Tab options
let g:myTabSize = 4 " Set myTabSize var to use below
let &shiftwidth = myTabSize " Tell vim how many columns is a tab
let &softtabstop = myTabSize " Tab and delete this many columns
let &tabstop = myTabSize " Actual hard tabstops will be my tab size
set expandtab " Make tabs be spaces
" set autoread " Always reload a file when it has changed instead of asking
set autoindent
set number " Line numbers
set mouse=a " Allow mouse scrolling, other mouse events
set t_Co=256
" set ignorecase
set smartcase " Smartcase in search
set cursorline " Show current line highlighted
set incsearch
" set nowrap
set tags=tags; " Tell vim to look for tags recursively downwords
set nostartofline " Keeps the cursor in its last spot when changing buffers (prevents it from going to start of line)
let g:python_host_prog = '/usr/bin/python'

""""""""""" View options
" set guifont=Hack:h12 " Font size; atom uses h14
" set linespace=4 " Line space; atom uses 4 (when font is 12 -- Atom uses 1.5 * line height)
syntax on
" set background=dark
" Options for jellybeans
" let g:jellybeans_overrides = {
" \    'Normal': { 'guifg': 'DBDBC3'},
" \    'CursorLine': { 'guibg': '2B2B2B' },
" \}
" Options for morhetz/gruvbox
" let g:gruvbox_bold=0
" let g:gruvbox_italic=1
" Options for molokai
let g:rehash256 = 1
colorscheme molokai
"Override background to force black
" autocmd VimEnter,Colorscheme * hi Normal guibg=#0D0D0D " Set background color to almost-black
" autocmd VimEnter,Colorscheme * hi LineNr guibg=#FFFFFF " Set line number background
" autocmd VimEnter,Colorscheme * hi SignColumn guibg=#0D0D0D " Set gutter background
"Markdown syntax finding
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"nginx syntax finding
autocmd BufNewFile,BufReadPost *.conf set filetype=nginx
" Spell checking options
autocmd BufRead,BufNewFile *.md setlocal spell "Auto turn on spellcheck for .md files
autocmd BufRead,BufNewFile hi clear SpellCap "Turn off capitalization spellcheck highlighting
autocmd FocusGained * silent! checktime "Tell neovim to always check if file has changed on focus
"
""""""""""" Key mappings
let mapleader=" "
noremap <leader>e :CtrlPMRU<cr>
" nnoremap <leader>m :CtrlPMixed<cr>
nnoremap <leader>v :CtrlPBuffer<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" " Map j and k to gj, gk, which move one line in wrapped text
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" End mapping j and k
nnoremap <leader>\ :NERDTreeToggle<cr>
nnoremap <leader>t :TlistToggle<cr>
" Switch buffers
nnoremap <leader>o :bp<cr>
nnoremap <leader>p :bn<cr>
" YCM shortcuts
nnoremap <c-]>      :YcmCompleter GoToDefinition<cr>
nnoremap <leader>d  :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>f  :YcmCompleter GoToReferences<cr>

""""""""""" Custom Commands
" command Bd 1,1000bd
" command Writing set wrap linebreak nolist columns=85 nocursorline nonumber
" command FormatJson %!python -m json.tool
"
" " F10 reveals the syntax highlighting on a specific character
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
