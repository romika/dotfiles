if &term=~'linux'
	colorscheme desert
elseif &term=~'xterm' || &term=~'screen-256color'
	" Set 256color
	set t_Co=256

	" Define colorscheme
	colorscheme molokai

	" Custom invisibles
	set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
	set showbreak=↪
endif

" Pathogen to manage vim plugins
execute pathogen#infect()
call pathogen#helptags()

" Set key 'R' for run python code
"let g:pymode_run_key = 'R'

" create projectfile for rope in current directory
"let g:pymode_rope_guess_project = 1

" ignore warning for too long lines
let g:pymode_lint_ignore = "E501"

" use vim as man page reader
let $PAGER=''

" Use filetype detection
filetype plugin indent on

" Formatting
autocmd filetype asm,python,markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
" Trim trailing whitespaces
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"Custom filetype detection
augroup filetypedetect
au BufNewFile,BufRead *.sv      setf verilog
au BufRead,BufNewFile *.tex setlocal filetype=tex  spell spelllang=en_us
augroup END 

" Highlights line which is active
set cursorline

" Ignores files that match these patters.
set wildignore+=*.png
set wildignore+=*.gif
set wildignore+=*.jpeg
set wildignore+=*.jpg
set wildignore+=*.ico
set wildignore+=*.pyc
set wildignore+=*.pyo
set wildignore+=*.db

" Disables swap-files.
set noswapfile

" textwidth
set wrap
"set textwidth=80

" matching brackets and the like
set showmatch

" Enable Syntax highlighting
syntax on
"
" Better command-line completion
set wildmenu

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Better match for searching in a file
set incsearch
set ignorecase
set smartcase

" Enable use of the mouse for all modes
set mouse=a

" Place backup and swap files in a seperate folder in .vim
set backup
set dir=~/.vim/backup/swap
set backupdir=~/.vim/backup/tmp
set writebackup

" Disable backup files (filename~)
"set nobackup

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Yank and copy to X Clipboard
set clipboard=unnamedplus

" Show invisibles
set list

" split windows more convenient
set splitbelow
set splitright

" Automatically save vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" gloabal tags for standard header files
"set tags+=~/.vim/bundle/tags/stdctags
"set tags+=~/.vim/bundle/tags/sysctags

" Avoid "ESC
:imap kj <Esc>
:imap jk <Esc>

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Improve movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Remap leader
let mapleader = ","

" Toggle invisibles
noremap <Leader>i :set list!<CR>

" Insert blank lines without going into insert mode
nmap t o<ESC>k
nmap T O<ESC>j

" jump through search results when using vimgrep 
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>N :cprevious<CR>

" spellcheck bindings
nnoremap <Leader>h z=
nnoremap <Leader>k [s 
nnoremap <Leader>j ]s

" Alt-right/left to navigate forward/backward in the tags stack
"nmap <Leader>k <C-T>
"nmap <Leader>j <C-]>

" Wrap text to 80 ch
noremap <Leader>w ggvGgq 

" space bar un-highligts search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Column after which is coding is very bad
"set colorcolumn=120
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey
"
" show misspelled words when cursorline is active
hi SpellBad cterm=underline
