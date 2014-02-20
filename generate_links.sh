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
#
if [ ! -L ${HOME}/.ssh/config ]; then ln -s ${PWD}/c_ssh_config ${HOME}/.ssh/config; fi

#ln -s {${PWD}/_,${HOME}/.}Xresources
#ln -s {${PWD}/_,${HOME}/.}vimrc
#ln -s {${PWD}/_,${HOME}/.}zshrc
#ln -s {${PWD}/_,${HOME}/.}zprofile
#ln -s {${PWD}/_,${HOME}/.}tmux.conf
