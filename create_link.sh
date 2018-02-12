#!/bin/sh
rm ~/.vimrc
ln -s ~/configs/vimrc ~/.vimrc
rm ~/.tmux.conf
ln -s ~/configs/tmux.conf ~/.tmux.conf
rm ~/.bashrc
ln -s ~/configs/bashrc ~/.bashrc
rm ~/.gitconfig
ln -s ~/configs/gitconfig ~/.gitconfig
rm ~/.vim
ln -s ~/configs/vim ~/.vim
rm ~/.ssh/config
ln -s ~/configs/config ~/.ssh/config
rm ~/.slate
ln -s ~/configs/slate ~/.slate
rm ~/split.sh
ln -s ~/configs/split.sh ~/split.sh
rm ~/percentile.sh
ln -s ~/configs/percentile.sh ~/percentile.sh
ln -fs ~/configs/tmux_sessions.sh ~/tmux_sessions.sh
ln -fs ~/configs/tmux_g_sessions.sh ~/tmux_g_sessions.sh
ln -fs ~/configs/pp ~/pp
chmod go-w ~/.ssh/config
