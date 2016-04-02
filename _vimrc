set nocompatible              " be iMproved, required


""" vim-plug
" autodownload if not installed yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Load on nothing

Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'Valloric/YouCompleteMe', { 'on': [] }
augroup load_us_ycm
	autocmd!
	autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
		\| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END
let g:ycm_server_python_interpreter = "/usr/bin/python"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:ycm_key_list_select_completion=['<tab>','Down']
"let g:ycm_key_list_previous_completion=['<s-tab>','Up']
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsExpandTrigger="<C-j>"
"let g:UltiSnipsJumpForwardTrigger="<C-b>"
"let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'fs111/pydoc.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Lokaltog/vim-easymotion'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/Gundo'
"Plug 'Shougo/unite.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'L9'
Plug 'matchit.zip'
Plug 'tmux-plugins/vim-tmux'
"Plug 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Plug 'file:///Users/gmarik/path/to/plugin'

" Add plugins to &runtimepath
call plug#end()

""""""""""""""""""

command! PU PlugUpdate | PlugUpgrade


set t_Co=16                                                
set background=dark " dark | light "                       
colorscheme solarized                                      
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

"autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
autocmd FileType python map <F3> :call Flake8()<CR>
nmap <silent> <F6> :call ToggleSpell()<CR>
map <F7> :tabp<Enter>
map <F8> :tabn<Enter>
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
