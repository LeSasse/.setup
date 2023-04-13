#!/usr/bin/sh

# check where we are
base=$(basename $PWD)
if [ "${base}" = ".setup" ]; then
  configs_path=$(realpath configs)
elif [ "${base}" = "scripts" ]
  configs_path=$(realpath ../configs)
fi

# set up a base venv
mkdir -p ${HOME}/.venvs
python3 -m venv ${HOME}/.venvs/base
source ${HOME}/.venvs/base/bin/activate
pip install -U pip
pip intall -r ${configs_path}/python_base.txt
