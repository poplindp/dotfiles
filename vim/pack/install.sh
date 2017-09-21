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
set_group basic
#package dietsche/vim-lastplace &
#package tpope/vim-unimpaired &
package Lokaltog/vim-easymotion &
package Xuyuanp/nerdtree-git-plugin &
package chrisbra/Recover.vim &
package chrisbra/changesPlugin &
package chrisbra/vim-diff-enhanced &
package jeetsukumaran/vim-buffergator &
package jiangmiao/auto-pairs &
package junegunn/fzf.vim &
package mbbill/undotree &
package pgdouyon/vim-evanesco &
package ryanoasis/vim-devicons &
package scrooloose/nerdcommenter &
package scrooloose/nerdtree &
package skywind3000/asyncrun.vim &
package thaerkh/vim-workspace & # or :mksession???
package tpope/vim-abolish.git &
package tpope/vim-repeat &
package tpope/vim-sensible &
package tpope/vim-sleuth & # automatic indent (* all other indents could be removed)
wait
) &

(
set_group programming
package Valloric/vim-operator-highlight &
package fisadev/vim-isort &
package fs111/pydoc.vim &
package majutsushi/tagbar &
wait
) &

(
set_group_opt programming
package ivanov/vim-ipython &
package nathanaelkane/vim-indent-guides &
)

(
set_group completion
#package 'Valloric/YouCompleteMe', { 'do': './install.py' } " Compile it with python2 install.py
package Shougo/neocomplete &
package Shougo/neosnippet &
package Shougo/neosnippet-snippets &
package honza/vim-snippets &
package ervandew/supertab &
wait
) &

(
set_group syntax
package Matt-Deacalion/vim-systemd-syntax.git &
package ap/vim-css-color.git &
package tmux-plugins/vim-tmux.git &
package chrisbra/vim-zsh &
package tbastos/vim-lua &
package zplug/vim-zplug &
wait
) &

(
set_group_opt syntax
package w0rp/ale &
)

(
set_group tmux
package benmills/vimux &
package christoomey/vim-tmux-navigator.git &
package keith/tmux.vim &
package tmux-plugins/vim-tmux-focus-events &
wait
) &

(
set_group git
package airblade/vim-gitgutter &
package gregsexton/gitv &
package jreybert/vimagit.git &
package tpope/vim-fugitive &
package tpope/vim-rhubarb.git &
wait
) &

(
set_group themes
package altercation/vim-colors-solarized.git &
package sjl/badwolf &
package tomasr/molokai &
package vim-airline/vim-airline-themes.git &
package vim-airline/vim-airline.git &
wait
) &

(
set_group extras
package dhruvasagar/vim-table-mode.git &
wait
) &

wait




echo "Plugins that havn't been updated by this script:"
find */*/*/.git -prune -mtime 0.01
