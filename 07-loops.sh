#!/bin/bash


for fruit in banana orange apple ; do
  echo Fruit Name = $fruit
  sleep 1
done

i=10

while [ $i -gt 0 ]; do
  echo Valie I = $i
  i=$(($i-1))
done
