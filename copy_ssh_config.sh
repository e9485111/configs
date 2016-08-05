for i in `cat hosts`;
do
  echo $i
  scp ~/configs/config $i:./configs
done
