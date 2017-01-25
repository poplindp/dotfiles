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
Plug 'Lokaltog/vim-easymotion'
Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'SirVer/ultisnips', { 'on': [] }
" Snippets are separated from the engine. vim-snippets are required
Plug 'honza/vim-snippets', { 'on': [] }

" Compile it with python2 install.py
Plug 'Valloric/YouCompleteMe'
augroup load_us_ycm
	autocmd!
	autocmd InsertEnter * call plug#load('ultisnips', 'vim-snippets', 'YouCompleteMe')
		\| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END
let g:ycm_server_python_interpreter = "/usr/bin/python2"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'nvie/vim-flake8', { 'on': [] }
Plug 'fs111/pydoc.vim', { 'on': [] }
augroup load_pythonland
	autocmd!
	autocmd FileType python call plug#load('pydoc.vim','vim-flake8') | autocmd! load_pythonland
augroup END 

Plug 'vim-scripts/Gundo', { 'on': [] }
augroup load_gundo
	autocmd!
	autocmd InsertEnter * call plug#load('Gundo') | autocmd! load_gundo
augroup END

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'

Plug 'Valloric/vim-operator-highlight'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

Plug 'Raimondi/delimitMate'
Plug 'pgdouyon/vim-evanesco'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }


Plug 'dietsche/vim-lastplace'
let g:lastplace_ignore = "gitcommit,svn"

" List of old plugins that im not sure they are useful
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'Shougo/unite.vim'
"Plug 'matchit.zip'

" Add plugins to &runtimepath
call plug#end()

command! PU PlugUpdate | PlugUpgrade
""""""""""""""""""

set t_Co=256
"NEVER set gsolarized_termcolors=256, DEGRADES colors
let g:solarized_termcolors=16
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized                                      
highlight Comment cterm=italic

":set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P
let $PYTHONPATH='/usr/lib/python3.5/site-packages'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:powerline_pycmd="py3"
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set number

set cursorline
set colorcolumn=80

map <F4> :SyntasticToggleMode<CR>
call togglebg#map("<F5>")
nmap <silent> <F6> :call ToggleSpell()<CR>
map <silent> <F7> :tabp<CR>
map <silent> <F8> :tabn<Enter>
nmap <F9> :TagbarToggle<CR>
set pastetoggle=<F12>


"NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"map <C-n> :NERDTreeToggle<CR>
silent! nmap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" Python files
"autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
autocmd FileType python map <F3> :call Flake8()<CR>
autocmd FileType python nnoremap <buffer> <F10> :exec '!python' shellescape(@%, 1)<cr>
