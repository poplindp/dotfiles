execute pathogen#infect()
syntax on
set nocompatible                                           

"Vundle
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle 'vim-scripts/Gundo'
" vim-scripts repos
Bundle 'L9'
Bundle 'matchit.zip'
"Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'


filetype plugin indent on

set t_Co=16                                                
call pathogen#infect()                                     
syntax on                                                  
set background=dark " dark | light "                       
colorscheme solarized                                      
filetype plugin on
set cursorline
set colorcolumn=80
call togglebg#map("<F5>")

"NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
