
runtime! autoload/pathogen.vim
call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

"change mapleader from \ to ,
let mapleader=","

set nocompatible
set autoread
set ruler
set wildmenu
set cmdheight=2

set lz

set showcmd


"	set ts=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab

"set linebreak

"set cindent

" Use indents of 2 spaces, and have them copied down lines:
set shiftround
set expandtab
set autoindent
set copyindent
set smartindent
set shiftwidth=2


" Normally don't automatically format 'text' as it is typed, i.e. only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79


filetype plugin indent on

set showmatch
set matchpairs+=<:> "To match arguments of templates
set ignorecase
set smartcase
set incsearch "show search matches as you type"
set hlsearch "highlight search terms"

set ai
set si
set sm

"colorscheme solarized
set background=dark
"colorscheme koehler
if has("gui_running")
  colorscheme jellybeans
  set mouse=a
else
"  let g:solarized_termcolors=256
  colorscheme solarized
  set mouse=  "allow right click to paste from windows"
endif
syntax enable



" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
"  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

"set helplang=cn


if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8 bomb
  set fileencodings=utf-8,ucs-bom,latin1
endif


"vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"my etc for template
let g:email='dawnwei.song@gmail.com'
let g:username='Xiao-Wei Song'
let g:dept='Institute of Biophysics, Chinese Academy of Science'

"file browsing
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

"auto close tags
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source /home/dawnsong/.vim/bundle/closetag.vim/plugin/closetag.vim


let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"
set wildignore=*.swp,*.bak,*.pyc,*.class
set title 
"beep deny
set visualbell
set noerrorbells
"backup deny
set nobackup
"set noswapfile

"nvie.com/posts/how-i-boosted-my-vim
"allow unwritten changes to a file and open a new file using 
set hidden

set backspace=indent,eol,start  "allow backspace over everything in insert mode"


"etc to load
"NeoComplCache
source /home/dawnsong/.vim/etc/neocomplcache.vimrc
source /home/dawnsong/.vim/etc/mru.vimrc

set dictionary+='/usr/share/dict/words'

