#!/bin/bash

for i in `seq -f '%02g' 1 $1`;
do
  vagrant up c64$i &
  sleep 10
done
wait
