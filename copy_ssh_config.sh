tar zcf ~/ssh.tar.gz ~/.ssh
tar zcf ~/configs.tar.gz ~/configs
if [ "$1" ];
then
  echo $1
  scp -o "StrictHostKeyChecking no" ~/ssh.tar.gz ~/configs.tar.gz $1:.
  #ssh -o "StrictHostKeyChecking no" $1 "rm -rf configs.bak .ssh.bak; mv .ssh .ssh.bak; mv configs configs.bak; tar zxf ssh.tar.gz -C /; tar zxf configs.tar.gz -C /; rm -rf ~/.ssh.bak ~/.configs.bak ~/ssh.tar.gz ~/configs.tar.gz; ~/configs/create_link.sh"
  ssh -o "StrictHostKeyChecking no" $1 "rm -rf configs.bak .ssh.bak; mv configs configs.bak; tar zxf ssh.tar.gz -C /; tar zxf configs.tar.gz -C /; ~/configs/create_link.sh"
else
  pscp -o "StrictHostKeyChecking no" -h hosts ~/ssh.tar.gz ~/configs.tar.gz ~/
  #pssh -o "StrictHostKeyChecking no" -h hosts "rm -rf configs.bak .ssh.bak; mv .ssh .ssh.bak; mv configs configs.bak; tar zxf ssh.tar.gz -C /; tar zxf configs.tar.gz -C /; rm -rf ~/.ssh.bak ~/.configs.bak ~/ssh.tar.gz ~/configs.tar.gz; ~/configs/create_link.sh"
  pssh -o "StrictHostKeyChecking no" -h hosts "rm -rf configs.bak .ssh.bak; mv configs configs.bak; tar zxf ssh.tar.gz -C /; tar zxf configs.tar.gz -C /; ~/configs/create_link.sh"
fi
rm ~/ssh.tar.gz ~/configs.tar.gz
