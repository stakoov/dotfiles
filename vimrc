set nocompatible
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-ruby'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'mileszs/ack.vim'
Bundle 'spolu/dwm.vim'
Bundle 'int3/vim-extradite'
Bundle 'walm/jshint.vim'
Bundle 'alunny/pegjs-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'tpope/vim-markdown'
Bundle 'reusee/vim.rust'
Bundle 'slim-template/vim-slim'
Bundle 'jasonkuhrt/Tomorrow-Theme'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'xolox/vim-session'

let g:vimwiki_use_mouse=0
Bundle 'vim-scripts/vimwiki'

" taken from
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" handle 256 colors in gnome terminal
set t_Co=256

let mapleader = ","

" Set encoding
set encoding=utf-8

" Whitespace stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Open the alternate file
map ,, <C-^>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Font
"set guifont="Terminus\ 9"

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Support github flavored markdown automatically
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Turn off menu in gui
set guioptions="agimrLt"
" Turn off mouse click in gui
set mouse=""

" Theme...
set background=dark
colorscheme Tomorrow-Night-Eighties

" highlight the current line
set cursorline
" Highlight active column
set cuc cul

" Show linenumbers
set number
set ruler

au BufReadPost *.thor set syntax=ruby

" Ack bits
map <leader>a :Ack! -ai 

" vimwiki config
nmap <Leader>wf <Plug>VimwikiFollowLink

" Remove highlights
nmap <Leader><CR> :nohlsearch<cr>

let g:Powerline_symbols="fancy"
python from powerline.bindings.vim import source_plugin; source_plugin()

" ftdetect isn't being pulled in from the vim-slim plugin for some reason
autocmd BufNewFile,BufRead *.slim set filetype=slim

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Run this file with rake
map <leader>t :!rake test TEST=%<CR>
map <leader>pt :!rake test_integration TEST=%<CR>
