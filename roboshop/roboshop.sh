#!/bin/bash

COMPONENT=$1

if [ ! -f components/$i.sh ]; then
  echo "Invalid Component Name is Provided"
  exit 1
fi

