#!/bin/bash
if [[ -z $HOME ]]; then
	echo "HOME variable is not set. Quitting.";
	exit 1;
fi;

# Check if the OS is OSX or Linux
OSX=0
uname -a | grep Darwin >/dev/null && OSX=1

NOW=$(date +"%m_%d_%Y-%H_%M_%S")

if [[ -f $HOME/.dotfiles/bash/functions ]]; then
	source "$HOME/.dotfiles/bash/functions"
else
	echo "Can't source functions"
	exit 1
fi
if ! require_clean_work_tree ~/.dotfiles; then
	exit 1;
fi

mkdir -p $HOME/.old_conf

if [[ -f $HOME/.dotfiles/bash/bashrc ]]; then
	if [[ -f $HOME/.bashrc ]]; then
		echo cp -L $HOME/.bashrc $HOME/.old_conf/bashrc_$NOW && rm $HOME/.bashrc;
	fi;
	echo "Linking $HOME/.bashrc to $HOME/.dotfiles/bash/bashrc"
	ln -s $HOME/.dotfiles/bash/bashrc $HOME/.bashrc
else
	echo "$HOME/.dotfiles/bash/bashrc: no such file";
fi


if [[ -f $HOME/.dotfiles/tmux/tmux.conf ]]; then
	if [[ -f $HOME/.tmux.conf ]]; then
		cp -L $HOME/.tmux.conf $HOME/.old_conf/tmux.conf_$NOW && rm $HOME/.tmux.conf;
	fi;
	echo "Linking $HOME/.tmux.conf to $HOME/.dotfiles/tmux/tmux.conf"
	ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
else
	echo "$HOME/.dotfiles/tmux/tmux.conf: no such file";
fi


if [[ -f $HOME/.dotfiles/vim/vimrc ]]; then
	if [[ -f $HOME/.vimrc ]]; then
		cp -L $HOME/.vimrc $HOME/.old_conf/vimrc_$NOW && rm $HOME/.vimrc;
	fi;
	echo "Linking $HOME/.vimrc to $HOME/.dotfiles/vim/vimrc"
	ln -s $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
else
	echo "$HOME/.dotfiles/vim/vimrc: no such file";
fi

if [[ -f $HOME/.dotfiles/mutt/muttrc ]]; then
	if [[ -f $HOME/.muttrc ]]; then
		cp -L $HOME/.muttrc $HOME/.old_conf/muttrc_$NOW && rm $HOME/.muttrc;
	fi;
	echo "Linking $HOME/.muttrc to $HOME/.dotfiles/mutt/muttrc"
	ln -s $HOME/.dotfiles/mutt/muttrc $HOME/.muttrc
else
	echo "$HOME/.dotfiles/mutt/muttrc: no such file";
fi

if [[ -f $HOME/.dotfiles/mutt/mailcap ]]; then
	if [[ -f $HOME/.mailcap ]]; then
		cp -L $HOME/.mailcap $HOME/.old_conf/mailcap_$NOW && rm $HOME/.mailcap;
	fi;
	echo "Linking $HOME/.mailcap to $HOME/.dotfiles/mutt/mailcap"
	ln -s $HOME/.dotfiles/mutt/mailcap $HOME/.mailcap
else
	echo "$HOME/.dotfiles/mutt/mailcap: no such file";
fi

if [[ -f $HOME/.dotfiles/mutt/urlview &&  OSX ]]; then
	if [[ -f $HOME/.urlview ]]; then
		cp -L $HOME/.urlview $HOME/.old_conf/urlview_$NOW && rm $HOME/.urlview;
	fi;
	echo "Linking $HOME/.urlview to $HOME/.dotfiles/mutt/urlview"
	ln -s $HOME/.dotfiles/mutt/urlview $HOME/.urlview
else
	echo "$HOME/.dotfiles/mutt/urlview: no such file";
fi
