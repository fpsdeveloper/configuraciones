set nocompatible              " be iMproved, required
syntax on
set nowrap
set encoding=utf8

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ajh17/Spacegray.vim'
"Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'itchyny/lightline.vim'
Plugin 'ternjs/tern_for_vim' , {'do':'npm install'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set vb t_vb=

packadd! matchit

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Autocomplete
" arranca vim pantalla completa
au GUIEnter * simalt ~x

set laststatus=2
" Theme and Styling 
set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray
"colorscheme gruvbox
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80

set number
set ruler
set cursorline

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""
" patrones de busqueda
""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
""""""""""""""""""""""""""""""""""""""""""
" ignorar extensiones de archivos
""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$']
""""""""""""""""""""""""""""""""""""""""""
" wildmenu
""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=longest:full,full

"""""""""""""""""""""""""""""""""""""""""""
" Ejecuta file en browser
"""""""""""""""""""""""""""""""""""""""""""
nnoremap <F4> :exe ':silent !"c:\Program Files\Mozilla Firefox\firefox.exe" %'<CR>

"""""""""""""""""""""""""""""""""""""""""""
" Jenkinsfile auto syntax
"""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead Jenkinsfile setf groovy 

""""""""""""""""""""""""""""""""""""""""""""""""""
" No muestro menu, toolbar ni scroll a la derercha
""""""""""""""""""""""""""""""""""""""""""""""""""
set go -=m
set go -=T
set go -=r
