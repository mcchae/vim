#!/bin/bash

if [[ $PP == darwin ]];then
    brew install vim --override-system-vim --HEAD
elif [[ $PP == linux* ]];then
    sudo apt-get install vim-nox-py2
fi

vim --version | grep "+python[^/]"
if [ $? -ne 0 ];then
	echo "Cannot find python enabled vim!"
	echo "in debian/ubuntu: sudo apt-get install vim-nox-py2"
	echo "in macOS: brew install vim --override-system-vim --HEAD"
	exit 1
fi

if [[ $PP == darwin ]];then
	brew install ctags
	brew install git
	sudo pip install dbgp vim-debug pep8 flake8 pyflakes isort
elif [[ $PP == linux* ]];then
	sudo apt-get install exuberant-ctags git
	sudo pip install dbgp vim-debug pep8 flake8 pyflakes isort
fi

wget https://raw.githubusercontent.com/mcchae/vim/master/vimrc -O $HOME/.vimrc
vim -E -u $HOME/.vimrc +qall

echo 'Install Complete! '
