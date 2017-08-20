#!/usr/bin/env bash

# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}

function set_group_opt () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/opt"
  mkdir -p "$path"
  cd "$path" || exit
}

# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  if [[ "$repo_url" != http* ]]
  then
    repo_url="https://github.com/${repo_url}"
  fi
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url"
  fi
}

(
set_group staging
package fatih/vim-go.git &
package tpope/vim-rhubarb.git &
package dhruvasagar/vim-table-mode.git &
wait
) &

(
set_group tpope
# package tpope/vim-dispatch.git &
# package tpope/vim-jdaddy.git &
package tpope/vim-fugitive.git &
package tpope/vim-surround.git &
package tpope/vim-ragtag.git &
package tpope/vim-abolish.git &
package tpope/vim-repeat.git &
package tpope/vim-commentary.git &
package tpope/vim-projectionist.git &
# package tpope/vim-vinegar.git &
wait
) &

# (
# set_group ruby
# package tpope/vim-rails.git &
# package tpope/vim-rake.git &
# package tpope/vim-bundler.git &
# package tpope/vim-endwise.git &
# wait
# ) &

(
set_group snippets
# Vim-snipmate and dependencies - VimL but buggy
package MarcWeber/vim-addon-mw-utils.git &
package tomtom/tlib_vim.git &
package garbas/vim-snipmate.git &
# Ultisnips is python but more functional
package SirVer/ultisnips.git &
wait
) &

(
set_group tmux
package christoomey/vim-tmux-navigator.git &
wait
) &

(
set_group syntax
package kchmck/vim-coffee-script.git &
package tpope/vim-markdown.git &
package ap/vim-css-color.git &
package pearofducks/ansible-vim.git &
package vim-scripts/applescript.vim.git &
package tmux-plugins/vim-tmux.git &
package Matt-Deacalion/vim-systemd-syntax.git &
package salomvary/vim-eslint-compiler.git &
package hashivim/vim-terraform.git &
wait
) &


(
set_group colorschemes
package altercation/vim-colors-solarized.git &
wait
) &

wait

#'tpope/vim-sensible'
#'Lokaltog/vim-easymotion'
#'mhinz/vim-startify'
#'altercation/vim-colors-solarized'
#'sjl/gundo.vim' ", { 'on': 'GundoToggle' }
#'~/.zplug/repos/junegunn/fzf' | Plug 'junegunn/fzf.vim'
#'junegunn/fzf', { 'do': 'yes \| ./install' }
#'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
#'scrooloose/nerdcommenter'
#'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
#'Xuyuanp/nerdtree-git-plugin'
#'ryanoasis/vim-devicons'
#'jlanzarotta/bufexplorer'
#'tpope/vim-unimpaired'
#'whatyouhide/vim-lengthmatters'
#'jiangmiao/auto-pairs'
#'junegunn/rainbow_parentheses.vim', { 'on':  'RainbowParentheses' }
#'pgdouyon/vim-evanesco'
#'djoshea/vim-autoread'
#'thaerkh/vim-workspace'
#'dietsche/vim-lastplace'
#'mhinz/vim-sayonara', { 'on': 'Sayonara' }
#
#'SirVer/ultisnips', { 'for': ['c', 'c++', 'perl', 'tcl', 'python'] }
#lug 'honza/vim-snippets', { 'for': ['c', 'c++', 'perl', 'tcl', 'python'] } " Snippets are separated from the engine. vim-snippets are required
#'Valloric/YouCompleteMe', { 'do': './install.py' } " Compile it with python2 install.py
#'w0rp/ale'
#'fs111/pydoc.vim', { 'for': 'python' }
#'python-mode/python-mode', { 'for': 'python' }
#'nathanaelkane/vim-indent-guides', { 'for': ['c', 'c++', 'perl', 'tcl', 'python', 'bash', 'zsh'] }
#'majutsushi/tagbar', { 'for': ['c++', 'python', 'bash', 'zsh'] }
#'Valloric/vim-operator-highlight'
#'skywind3000/asyncrun.vim'
#
#'tpope/vim-fugitive'
#'airblade/vim-gitgutter'
#
#'christoomey/vim-tmux-navigator'
#
#'tmux-plugins/vim-tmux'
#'zplug/vim-zplug'
#'chrisbra/vim-zsh'
#'tpope/vim-sleuth'



# echo "Plugins that havn't been updated by this script:"
find */*/*/.git -prune -mtime 0.01
