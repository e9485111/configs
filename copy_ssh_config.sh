tar zcf ~/ssh.tar.gz ~/.ssh
tar zcf ~/configs.tar.gz ~/configs
if [ "$1" ];
then
  echo $1
  scp ~/ssh.tar.gz ~/configs.tar.gz $1:.
  ssh $1 "rm -rf configs.bak .ssh.bak; mv .ssh .ssh.bak; mv configs configs.bak; tar zxf ssh.tar.gz -C /; tar zxf configs.tar.gz -C /; rm -rf ~/.ssh.bak ~/.configs.bak ~/ssh.tar.gz ~/configs.tar.gz"
else
  pscp -h hosts ~/ssh.tar.gz ~/configs.tar.gz ~/
  pssh -h hosts "rm -rf configs.bak .ssh.bak; mv .ssh .ssh.bak; mv configs configs.bak; tar zxf ssh.tar.gz -C /; tar zxf configs.tar.gz -C /; rm -rf ~/.ssh.bak ~/.configs.bak ~/ssh.tar.gz ~/configs.tar.gz"
fi
rm ~/ssh.tar.gz ~/configs.tar.gz
