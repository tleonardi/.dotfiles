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

if [[ -f $HOME/.dotfiles/mutt/muttrc &&  OSX ]]; then
	if [[ -f $HOME/.muttrc ]]; then
		cp -L $HOME/.muttrc $HOME/.old_conf/muttrc_$NOW && rm $HOME/.muttrc;
	fi;
	echo "Linking $HOME/.muttrc to $HOME/.dotfiles/mutt/muttrc"
	ln -s $HOME/.dotfiles/mutt/muttrc $HOME/.muttrc
else
	echo "$HOME/.dotfiles/mutt/muttrc: no such file";
fi

if [[ -f $HOME/.dotfiles/mutt/mailcap &&  OSX ]]; then
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

if [[ -f $HOME/.dotfiles/afew/config &&  OSX ]]; then
        if [[ -f $HOME/.config/afew/config ]]; then
                cp -L $HOME/.config/afew/config $HOME/.old_conf/afew.config_$NOW && rm $HOME/.config/afew/config
        fi;
        echo "Linking afew config"
        ln -s $HOME/.dotfiles/afew/config $HOME/.config/afew/config
else
        echo "$HOME/.dotfiles/afew/config: no such file";
fi

if [[ -f $HOME/.dotfiles/offlineimap/offlineimaprc &&  OSX ]]; then
        if [[ -f $HOME/.offlineimaprc ]]; then
                cp -L $HOME/.offlineimaprc $HOME/.old_conf/afew.config_$NOW && rm $HOME/.offlineimaprc
        fi;
        echo "Linking offlineimap config"
        ln -s $HOME/.dotfiles/offlineimap/offlineimaprc $HOME/.offlineimaprc
else
        echo "$HOME/.dotfiles/offlineimap/offlineimaprc: no such file";
fi

if [[ -f $HOME/.dotfiles/notmuch/notmuch-config &&  OSX ]]; then
        if [[ -f $HOME/.notmuch-config ]]; then
                cp -L $HOME/.notmuch-config $HOME/.old_conf/notmuch_$NOW && rm $HOME/.notmuch-config
        fi;
        echo "Linking notmuch config"
        ln -s $HOME/.dotfiles/notmuch/notmuch-config $HOME/.notmuch-config
else
        echo "$HOME/.dotfiles/notmuch/notmuch-config: no such file";
fi

if [[ -f $HOME/.dotfiles/notmuch/post-new &&  OSX ]]; then
        if [[ -f $HOME/.mail/.notmuch/hooks/post-new ]]; then
                cp -L $HOME/.mail/.notmuch/hooks/post-new $HOME/.old_conf/notmuch_post-new && rm $HOME/.mail/.notmuch/hooks/post-new
        fi;
        echo "Linking notmuch post-new config"
        ln -s $HOME/.dotfiles/notmuch/post-new $HOME/.mail/.notmuch/hooks/post-new
else
        echo "$HOME/.dotfiles/notmuch/post-new: no such file";
fi

if [[ -f $HOME/.dotfiles/notmuch/pre-new &&  OSX ]]; then
        if [[ -f $HOME/.mail/.notmuch/hooks/pre-new ]]; then
                cp -L $HOME/.mail/.notmuch/hooks/pre-new $HOME/.old_conf/notmuch_pre-new && rm $HOME/.mail/.notmuch/hooks/pre-new
        fi;
        echo "Linking notmuch pre-new config"
        ln -s $HOME/.dotfiles/notmuch/pre-new $HOME/.mail/.notmuch/hooks/pre-new
else
        echo "$HOME/.dotfiles/notmuch/pre-new: no such file";
fi
