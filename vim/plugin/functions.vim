function SetCompilerForRspec()
  compiler rspec
  if !empty(glob('.zeus.sock'))
    set makeprg=zeus\ rspec
    " nmap <leader>s :Start zeus rspec %\:=line('.')<CR><CR>
  elseif !empty(glob('Gemfile'))
    set makeprg=bundle\ exec\ rspec
    " nmap <leader>s :Start bundle exec rspec %\:=line('.')<CR><CR>
  else
    set makeprg=rspec
    " nmap <leader>s :Start rspec %\:=line('.')<CR><CR>
  endif
endfunction

" Useful for migrating config between terraform environments in the Lic-NZ.
" Also useful:
"
"   diff ./ ../../../dev/services/$(basename $(pwd))/ --color --exclude="secrets*"
"
" Or, if you have the script installed:
"
"   licdiff dev
function LicDiff(env)
  let file_path = "../../../" . a:env . "/services/" . expand('%:p:h:t') . "/%"
  diffthis
  vs
  exec "edit " . file_path
  diffthis
endfunction
