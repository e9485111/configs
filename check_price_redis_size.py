#!/bin/bash
#216.69.136.137
IFS=$'\n'
cmd=("scard EXCLUSION" "scard EXCLUSION-TEST" "hlen premiumdomain2tierid" "hlen premiumdomain2tierid-test")

list=("p3plfinddev07.prod.phx3.gdg" "p3plfinddev02.prod.phx3.gdg" "p3plfinddev05.prod.phx3.gdg" "m1plfinddev02.prod.mesa1.gdg" "m1plfinddev05.prod.mesa1.gdg" "a2plfinddev02.prod.iad2.gdg" "a2plfinddev05.prod.iad2.gdg")
for c in ${cmd[@]};
do
echo $c
    for i in ${list[@]};
    do
        v=`echo $c|redis-cli -h $i -p 7379`
        echo "  $v $i"
    done
done
exit

