"
" tpope/vim-dispatch
" ==================
" After running a build, use cg to clean up the output to only list errors.
" nmap <leader>m :Make %\:=line('.')<CR><CR>
" nmap <leader>M :Make %<CR>
" See ~/.vim/ftdetect/rspec.vim for this binding.
" nmap <leader>s :Start bundle exec rspec %\:=line('.')<CR><CR>




"
" fatih/vim-go
" ============
let g:go_fmt_command = "goimports"



"
" kien/ctrlp.vim
" ==============

" map <leader>] :CtrlP<CR>
" Use The Silver Searcher
" https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif



"
" thoughtbot/pick.vim
" ===================

" nnoremap <Leader>] :call PickFile()<CR>



"
" tpope/vim-markdown
" ==================

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']



"
" christoomey/vim-tmux-navigator
" ==============================

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
