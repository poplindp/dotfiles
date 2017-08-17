set nocompatible              " be iMproved, required

"""""""""
"""""""""  vim-plug
"""""""""
"""""""""  { 'on': [] }:   doesn't load automatically, use :PlugStatus

" autodownload if not installed yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'Lokaltog/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/gundo.vim' ", { 'on': 'GundoToggle' }
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-unimpaired'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'jiangmiao/auto-pairs'
Plug 'pgdouyon/vim-evanesco'
Plug 'djoshea/vim-autoread'
Plug 'thaerkh/vim-workspace'
Plug 'dietsche/vim-lastplace'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

Plug 'SirVer/ultisnips', { 'for': ['c', 'c++', 'perl', 'tcl', 'python'] }
    Plug 'honza/vim-snippets', { 'for': ['c', 'c++', 'perl', 'tcl', 'python'] } " Snippets are separated from the engine. vim-snippets are required
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " Compile it with python2 install.py
Plug 'w0rp/ale'
Plug 'fs111/pydoc.vim', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'nathanaelkane/vim-indent-guides', { 'for': ['c', 'c++', 'perl', 'tcl', 'python'] }
Plug 'majutsushi/tagbar', { 'for': ['c++', 'python'] }
Plug 'Valloric/vim-operator-highlight'
Plug 'skywind3000/asyncrun.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'


" List of plugins that not sure they are useful
"Plug 'scrooloose/syntastic', {}   "replaced by ale
"Plug 'nvie/vim-flake8', { 'for': 'python' }   "replaced by ale
"Plug 'terryma/vim-multiple-cursors'

" Add plugins to &runtimepath
call plug#end()

command! PU PlugUpdate | PlugUpgrade

"""""""""
"""""""""
"""""""""

let mapleader = ","  "sets up the leader for all maps
let maplocalleader = "\\" "a prefix for mappings that only take effect for certain types of files

let $PYTHONPATH='/usr/lib/python3.6/site-packages'

set encoding=utf-8
set anti enc=utf-8
set guifont=InconsolataForPowerline\ Nerd\ Font\ 12
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set number
set cursorline
set colorcolumn=80
set showbreak=↪
set t_Co=256


""" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
let g:powerline_pycmd="py3"

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

" autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


"""""""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""""""

" vim-easymotion
map <Tab> <Plug>(easymotion-prefix)

" vim-colors-solarized
let g:solarized_termcolors= 16 	" 16 | 256,  256 degrades colors
let g:solarized_termtrans = 0 	" 0 | 1
let g:solarized_degrade = 0	" 0 | 1
let g:solarized_bold = 1	" 1 | 0
let g:solarized_underline = 1	" 1 | 0
let g:solarized_italic = 1	" 1 | 0
let g:solarized_contrast = "normal" 	" "normal"| "high" or "low"
let g:solarized_visibility= "normal"	" "normal"| "high" or "low"
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
highlight Comment cterm=italic

" nerdtree
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrows=1
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" vim-devicons
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" YouCompleteMe
augroup load_us_ycm
	autocmd!
	autocmd InsertEnter * call plug#load('ultisnips', 'vim-snippets', 'YouCompleteMe')
		\| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END
"let g:ycm_server_python_interpreter = "/usr/bin/python2"
let g:ycm_server_python_interpreter = "/usr/bin/python"
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

"" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ale (replace syntastic and flake8 in vim8)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" python-mode (do not erase .ropeproject directory)
let g:pymode_python = 'python3'
let g:pymode_options = 1

" Gundo
let g:gundo_prefer_python3 = 1

" vim-fugitive
augroup fugitive
	autocmd!
	autocmd BufReadPost fugitive://* set bufhidden=delete
set diffopt+=vertical

" vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" vim-lastplace
let g:lastplace_ignore = "gitcommit,svn"

" vim-workspace
let g:workspace_session_name = 'Session.vim'



"
" Functions
"


augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction



"
" FILES
"
"
" Python files
augroup programming_files
	"autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
	autocmd FileType python,cpp,c,perl,tcl nmap <buffer> <F6> :ALEToggle<CR>
	autocmd FileType python,cpp,c,perl,tcl nnoremap <F10> :call <SID>compile_and_run()<CR>
	"autocmd FileType python nnoremap <buffer> <F10> :exec '!python' shellescape(@%, 1)<cr>
	autocmd FileType python,cpp,c,perl,tcl :IndentGuidesEnable
	autocmd FileType python,cpp,c,perl,tcl :ALEEnable
	autocmd FileType python,cpp :TagbarOpen
"map <F4> :SyntasticToggleMode<CR>
augroup END

augroup text_files
    autocmd!
    autocmd FileType tex,latex,context,plaintex,text nmap <silent> <buffer> <F6> :call ToggleSpell()<CR>
"nmap <silent> <F6> :call ToggleSpell()<CR>
augroup END

"
" Mappings
"
" :IndentGuidesToggle

call togglebg#map("<F2>")
nnoremap <silent> <F3> :GundoToggle<CR>
map <silent> <F4> :NERDTreeToggle<CR>
map <silent> <F5> :ToggleBufExplorer<CR>
"map <silent> <F6> USED by Spell, Syntax
map <silent> <F7> :tabp<CR>
map <silent> <F8> :tabn<CR>
nmap <F9> :TagbarToggle<CR>
"map <silent> <F10> USED by exec
set pastetoggle=<F12>

nnoremap <localleader>s :ToggleWorkspace<CR>
