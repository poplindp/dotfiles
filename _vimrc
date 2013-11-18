execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible                                           
set t_Co=16                                                
call pathogen#infect()                                     
syntax on                                                  
set background=dark " dark | light "                       
colorscheme solarized                                      
filetype plugin on
set cursorline
set colorcolumn=80
call togglebg#map("<F5>")
