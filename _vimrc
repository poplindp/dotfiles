execute pathogen#infect()
syntax on

"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" " required! 
Plugin 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-scripts/Gundo'
Plugin 'fs111/pydoc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'ervandew/supertab'
Plugin 'nvie/vim-flake8'
"Plugin 'Townk/vim-autoclose'
" vim-scripts repos
Plugin 'L9'
Plugin 'matchit.zip'
"Plugin 'FuzzyFinder'
" non-GitHub repos
Plugin 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///Users/gmarik/path/to/plugin'

"using snip-mate or ultisnips
"Plugin 'garbas/vim-snipmate'
" ULTISNIPS
" Track the engine.
Plugin 'SirVer/ultisnips'
"
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""

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


" Spell Check
let b:myLang=0
let g:myLangList=["nospell","en","fr","it","es"]
function! ToggleSpell()
	let b:myLang=b:myLang+1
	if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
	if b:myLang==0
		setlocal nospell
	else
		execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
	endif
	echo "spell checking language:" g:myLangList[b:myLang]
endfunction

set number

nmap <silent> <F6> :call ToggleSpell()<CR>
map <F7> :tabp<Enter>
map <F8> :tabn<Enter>

autocmd FileType python nnoremap <buffer> <F9> :exec '!python2' shellescape(@%, 1)<cr>

