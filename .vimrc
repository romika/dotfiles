if &term=~'linux'
	colorscheme desert
elseif &term=~'xterm' || &term=~'-256color'
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
let g:pymode_run_key = 'R'

" create projectfile for rope in current directory
"let g:pymode_rope_guess_project = 1

" ignore warning for too long lines
let g:pymode_lint_ignore = "E501"

" use vim as man page reader
let $PAGER=''

" Remap leader
let mapleader = ","

" Use filetype detection
filetype plugin indent on

"Custom filetype detection
augroup filetypedetect
	au BufNewFile,BufRead *.sv      setf verilog
	au BufRead,BufNewFile *.tex setlocal filetype=tex  spell spelllang=en_us
	au filetype asm,python,markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
augroup END

augroup preandpostprocessing
	autocmd!
	" Trim trailing whitespaces
	au BufWritePre *.py normal m`:%s/\s\+$//e ``
augroup END

" Automatically save vimrc when it's saved
augroup autosave
	autocmd!
	au BufWritePost .vimrc so ~/.vimrc
augroup end

" Highlights line which is active
set cursorline

" show misspelled words when cursorline is active
hi SpellBad cterm=underline

" Column after which is coding is very bad
"set colorcolumn=120
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey
"
" textwidth
set wrap

" matching brackets and the like
set showmatch

" Enable Syntax highlighting
syntax on
"
" Better command-line completion
set wildmenu

" Ignores files that match these patters.
set wildignore+=*.png
set wildignore+=*.gif
set wildignore+=*.jpeg
set wildignore+=*.jpg
set wildignore+=*.ico
set wildignore+=*.pyc
set wildignore+=*.pyo
set wildignore+=*.db
set wildignore+=*.so
set wildignore+=*.o

" highlight matches for a search
set hlsearch

" Better match for searching in a file
set incsearch
set ignorecase
set smartcase

" Enable use of the mouse for all modes
set mouse=a

" Place backup and swap files in a seperate folder in .vim
set writebackup
set backup
set backupdir=~/.vim/backup/tmp

" Disables swap-files.
set noswapfile

" Set the command window height to 2 lines, to avoid many cases of having to
set cmdheight=2

" show in ruler your position
set ruler

" Display line numbers on the left
set number

" Yank and copy to X Clipboard
set clipboard=unnamedplus

" Show invisibles
set list

" gloabal tags for standard header files
"set tags+=~/.vim/bundle/tags/stdctags
"set tags+=~/.vim/bundle/tags/sysctags

" Alt-right/left to navigate forward/backward in the tags stack
"nmap <Leader>k <C-T>
"nmap <Leader>j <C-]>

" Avoid ESC
inoremap kj <Esc>
inoremap jk <esc>
cnoremap kj <Esc>
cnoremap jk <Esc>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
" Easy split navigation
"nnoremap <M-h> <C-w>h
"nnoremap <M-j> <C-w>j
"nnoremap <M-k> <C-w>k
"nnoremap <M-l> <C-w>l

nnoremap <C-c> <C-w>c

" Toogle zoom current window
nnoremap <silent> <C-o> :ZoomWin<CR>

" Improve movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Toggle invisibles
noremap <Leader>i :set list!<CR>

" Insert blank lines without going into insert mode
nnoremap t o<ESC>k
nnoremap T O<ESC>j

" jump through search results when using vimgrep 
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>N :cprevious<CR>

" spellcheck bindings
nnoremap <Leader>h z=
nnoremap <Leader>k [s 
nnoremap <Leader>j ]s

" start ctrlp
nnoremap <silent> <C-f> :CtrlP<CR>

" space bar un-highligts search
noremap <silent> <Space> :silent noh<Bar>echo<CR>
