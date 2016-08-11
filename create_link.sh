#!/bin/sh
install_fasd=1
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
chmod go-w ~/.ssh/config
if [ ! -f /usr/local/bin/fasd ];
then
  echo "Installing fasd"
  pushd .
  cd ~
  wget https://github.com/clvv/fasd/tarball/1.0.1
  tar zxvf 1.0.1
  cd clvv-fasd-4822024
  cat /tmp/p| sudo -S make install
  cd ..
  rm -rf 1.0.1 clvv-fasd-4822024
  popd
else
  echo "fasd already installed"
fi
echo "installing yum repo"
cat /tmp/p| sudo -S rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
cat /tmp/p| sudo -S rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
