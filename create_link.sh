#!/bin/sh
install_fasd=0
ln -s ~/configs/vimrc ~/.vimrc
ln -s ~/configs/tmux.conf ~/.tmux.conf
ln -s ~/configs/bashrc ~/.bashrc
ln -s ~/configs/gitconfig ~/.gitconfig
ln -s ~/configs/vim ~/.vim
#ln -s ~/configs/mysql_prod.sh ~/mysql_prod.sh
#ln -s ~/configs/mysql_dev.sh ~/mysql_dev.sh
ln -s ~/configs/config ~/.ssh/config
ln -s ~/configs/slate ~/.slate
chmod go-w ~/.ssh/config
if [ $install_fasd -eq 1 ];
then
  echo "Installing fasd"
  pushd .
  cd ~
  wget https://github.com/clvv/fasd/tarball/1.0.1
  tar zxvf 1.0.1
  cd clvv-fasd-4822024
  sudo make install
  popd
fi
