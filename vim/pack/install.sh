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
  repo_url=$1
  if [[ "$repo_url" != http* ]]
  then
    repo_url="https://github.com/${repo_url}"
  fi
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

(
set_group python
package fisadev/vim-isort &
package majutsushi/tagbar &
package nathanaelkane/vim-indent-guides &
wait
) &

(
set_group snippets
# Vim-snipmate and dependencies - VimL but buggy
package MarcWeber/vim-addon-mw-utils.git &
package tomtom/tlib_vim.git &
package garbas/vim-snipmate.git &
# Ultisnips is python but more functional
package SirVer/ultisnips.git &
package ajh17/VimCompletesMe.git &
wait
) &

(
set_group tmux
package christoomey/vim-tmux-navigator.git &
package keith/tmux.vim &
#'tmux-plugins/vim-tmux-focus-events'
#'christoomey/vim-tmux-navigator'
#
#'tmux-plugins/vim-tmux'
wait
) &

(
set_group git
package jreybert/vimagit.git &
package tpope/vim-fugitive &
package airblade/vim-gitgutter &
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
package w0rp/ale &
wait
) &


(
set_group colorschemes
#package altercation/vim-colors-solarized.git &
package vim-airline/vim-airline.git &
package vim-airline/vim-airline-themes.git &
wait
) &

(
set_group basic
package chrisbra/changesPlugin &
package chrisbra/vim-diff-enhanced &
wait
) &


(
set_group search
package junegunn/fzf.vim &
wait
)

(set_group edition
package scrooloose/nerdcommenter &
package scrooloose/nerdtree &
package Xuyuanp/nerdtree-git-plugin &
wait
)

wait

#'tpope/vim-sensible'
#'Lokaltog/vim-easymotion'
#'mhinz/vim-startify'
#'sjl/gundo.vim' ", { 'on': 'GundoToggle' }
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
#'fs111/pydoc.vim', { 'for': 'python' }
#'python-mode/python-mode', { 'for': 'python' }
#'Valloric/vim-operator-highlight'
#'skywind3000/asyncrun.vim'
#
#'zplug/vim-zplug'
#'chrisbra/vim-zsh'
#'tpope/vim-sleuth'



# echo "Plugins that havn't been updated by this script:"
find */*/*/.git -prune -mtime 0.01
