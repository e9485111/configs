if [ "$1" ];
then
  echo $1
  scp ~/.ssh/* $i:./.ssh
  scp ~/configs/config $1:./configs
else
  for i in `cat hosts`;
  do
    echo $i
    scp ~/.ssh/* $i:./.ssh
    scp ~/configs/config $i:./configs
  done
fi
