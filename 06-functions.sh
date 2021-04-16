#!/bin/bash

## Declare the function
function sample1() {
  echo a - $a
  echo Hello from Function1
  b=20
}

sample2() {
  echo Hello from Funtion2

  echo First Argument in Function = $1
}

## Access the function

a=10
sample1
sample2 200 
echo b - $b


echo First Argument = $1


