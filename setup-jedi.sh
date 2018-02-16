#!/usr/bin/env bash


export PYENV_VERSION=3.6.4

DIR=~/.emacs.d/.python-environments

mkdir -p $DIR
cd $DIR

pyenv local $PYENV_VERSION
virtualenv -p python --prompt="<venv:jedi>" jedi
$DIR/jedi/bin/pip install ~/.emacs.d/elpa/jedi-core-0.2.7

unset PYENV_VERSION
