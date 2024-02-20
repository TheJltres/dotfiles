#!/usr/bin/env bash

CURRENTPATH=$(pwd)
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd $SCRIPTPATH
stow -t $HOME .

cd $CURRENTPATH
