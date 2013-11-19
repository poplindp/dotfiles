#!/bin/sh

for dotfile in _*
do 
	if [ ! -L ${HOME}/.${dotfile##_} ]
	then
		echo "Generating symbolic link ${HOME}/.${dotfile##_} to ${PWD}/${dotfile}"
		ln -s {${PWD}/_,${HOME}/.}${dotfile##_}
	else
		echo "Skipping existant ${HOME}/.${dotfile##_}"
	fi
done

#ln -s {${PWD}/_,${HOME}/.}Xresources
#ln -s {${PWD}/_,${HOME}/.}vimrc
#ln -s {${PWD}/_,${HOME}/.}zshrc
#ln -s {${PWD}/_,${HOME}/.}zprofile
#ln -s {${PWD}/_,${HOME}/.}tmux.conf
