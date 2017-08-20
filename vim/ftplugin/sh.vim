set makeprg=shellcheck\ -f\ gcc\ %
" au BufWritePost * :silent make | redraw!

" Automatically open the quickfix window if ShellCheck found any problems
" au QuickFixCmdPost [^l]* nested cwindow
" au QuickFixCmdPost    l* nested lwindow
