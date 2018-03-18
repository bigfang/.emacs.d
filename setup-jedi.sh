#!/usr/bin/env bash


export PYENV_VERSION=3.6.4

DIR=~/.emacs.d/.python-environments

mkdir -p $DIR
cd $DIR

pyenv local $PYENV_VERSION
virtualenv -p python --prompt="<venv:jedi>" jedi

$DIR/jedi/bin/pip install ~/.emacs.d/elpa/jedi-core-20170121.610
$DIR/jedi/bin/pip install flake8 ipython

unset PYENV_VERSION
