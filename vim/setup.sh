#!/bin/sh

__sh_config_path="https://raw.githubusercontent.com/itsYakub/dotfiles/refs/heads/main/vim/.vimrc"
__sh_vimplug_path="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

function sh_check_util {
	if command -v $1 2>&1 > /dev/null
	then
		echo "[ $(date +%H:%M:%S) ] $1: found"
	else
		echo "[ $(date +%H:%M:%S) ] $1: not found"
		exit 1
	fi;
}

# STEP 1: Check if utilities exists...

sh_check_util git
sh_check_util wget
sh_check_util curl
sh_check_util vim

# STEP 2: Download the config file from github...

echo "[ $(date +%H:%M:%S) ] wget: processing $__sh_config_path..."

wget -qO - $__sh_config_path > $HOME/.vimrc
if [ "$(echo $?)" -eq 0 ];
then
	echo "[ $(date +%H:%M:%S) ] wget: success"
else
	echo "[ $(date +%H:%M:%S) ] wget: failure"
	exit 1
fi;

# STEP 3: Clone vim-plug...

echo "[ $(date +%H:%M:%S) ] curl: processing $__sh_vimplug_path..."

curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs $__sh_vimplug_path
if [ "$(echo $?)" -eq 0 ];
then
	echo "[ $(date +%H:%M:%S) ] curl: success"
else
	echo "[ $(date +%H:%M:%S) ] curl: failure"
	exit 1
fi;

# STEP 4: Configure vim with vim-plug

echo "[ $(date +%H:%M:%S) ] vim: settig up the environment"

vim -E -c "PlugUpdate" -c "q" -c "q"
if [ "$(echo $?)" -eq 0 ];
then
	echo "[ $(date +%H:%M:%S) ] vim: success"
else
	echo "[ $(date +%H:%M:%S) ] vim: failure"
	exit 1
fi;
