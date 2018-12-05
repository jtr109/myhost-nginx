#!/bin/bash
currentDir=$(
  cd $(dirname "$0")
  pwd
)

echo -n "current "
pwd
echo script $currentDir
