unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Helps force plugins to load correctly when it is turned back on below
filetype off

call plug#begin()

" List your plugins here
Plug 'preservim/nerdtree'

call plug#end()

syntax on

filetype plugin indent on
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set number
set relativenumber

" Blink cursor on error instead of beeping (grr)
set visualbell
set encoding=UTF-8
set ruler

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

if $COLORTERM == 'truecolor'
	set termguicolors
endif

let mapleader="\<space>"
nnoremap <leader>c :botright term<CR>
" Rendering
set ttyfast

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>