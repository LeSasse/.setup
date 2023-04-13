#!/usr/bin/sh

#
# Create links for each of the config files
#
  
# check where we are
base=$(basename $PWD)
if [ "${base}" = ".setup" ]; then
  configs_path=$(realpath configs)
elif [ "${base}" = "scripts" ]
  configs_path=$(realpath ../configs)
fi

# make .zfunctions dir if not there yet
mkdir -p ${HOME}/.zfunctions
mkdir -p ${HOME}/.zthemes

mkdir -p ${HOME}/.config/helix

ln -svf "$(realpath zfunctions)"/search_zsh_history.sh ${HOME}/.zfunctions/search_zsh_history.sh

ln -svf ${configs_path}/zlogin ${HOME}/.zlogin
ln -svf ${configs_path}/zshenv ${HOME}/.zshenv
ln -svf ${configs_path}/zshrc ${HOME}/.zshrc

ln -svf ${configs_path}/helix/config.toml ${HOME}/.config/helix/config.toml
ln -svf ${configs_path}/helix/languages.toml ${HOME}/.config/helix/languages.toml

ln -svf "$(realpath themes)"/prompt_cliche_setup ${HOME}/.zthemes/prompt_cliche_setup

echo 'Done!'