#!/bin/bash
# stdin should be integers, one per line.
tmp="/tmp/pct"
total=$(sort -n | tee "$tmp" | wc -l)
echo "Total: $total"
for i in 50 75 95
do
percentile=$i
# (n + 99) / 100 with integers is effectively ceil(n/100) with floats
count=$(((total * percentile + 99) / 100))
res=`head -n $count "$tmp" | tail -n 1`
echo "$i percentile: $res"
done
rm "$tmp"
