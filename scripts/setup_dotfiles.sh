#!/usr/bin/sh

#
# Create links for each of the config files
#
  
# check where we are
base=$(basename $PWD)
if [ "${base}" = ".setup" ]; then
  configs_path=$(realpath configs)
  functions_path=$(realpath zfunctions)
  themes_path=$(realpath themes)
elif [ "${base}" = "scripts" ]; then
  configs_path=$(realpath ../configs)
  functions_path=$(realpath ../zfunctions)
  themes_path=$(realpath ../themes)
fi

# make .zfunctions dir if not there yet
mkdir -p ${HOME}/.zfunctions
mkdir -p ${HOME}/.zthemes

mkdir -p ${HOME}/.config/helix

# zsh set up
ln -svf ${functions_path}/search_zsh_history.sh ${HOME}/.zfunctions/search_zsh_history.sh
ln -svf ${configs_path}/zlogin ${HOME}/.zlogin
ln -svf ${configs_path}/zshenv ${HOME}/.zshenv
ln -svf ${configs_path}/zshrc ${HOME}/.zshrc
ln -svf ${themes_path}/prompt_cliche_setup ${HOME}/.zthemes/prompt_cliche_setup

# git set up
ln -svf ${configs_path}/gitconfig ${HOME}/.gitconfig
read -p "What is your git username?" gituser
read -p "What is your git e-mail address?" gitemail
git config user.name ${gituser}
git config user.email ${gitemail}

# helix set up
ln -svf ${configs_path}/helix/config.toml ${HOME}/.config/helix/config.toml
ln -svf ${configs_path}/helix/languages.toml ${HOME}/.config/helix/languages.toml


echo 'Done!'