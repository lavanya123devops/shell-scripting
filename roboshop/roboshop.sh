#!/bin/bash

COMPONENT=$1

if [ ! -f components/${COMPONENT}.sh ]; then
  echo "Invalid Component Name is Provided"
  exit 1
fi

export COMPONENT
bash components/${COMPONENT}.sh
