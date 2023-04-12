#!/usr/bin/sh

#
# Install some basic requirements for my set up
#

# Check if Git is installed
if ! [ -x "$(command -v git)" ]; then
  echo 'Git is not installed. Installing Git...'
  sudo apt-get update
  sudo apt-get install -y git
fi

# install helix if needed to make it the editor later
if ! [ -x "$(command -v hx)" ]; then
  echo 'Helix is not installed. Installing Helix...'
  sudo add-apt-repository ppa:maveonair/helix-editor
  sudo apt update
  sudo apt install helix
fi

# Check if Zsh is installed
if ! [ -x "$(command -v zsh)" ]; then
  echo 'Zsh is not installed. Installing Zsh...'
  sudo apt-get update
  sudo apt-get install -y zsh
fi

# download and install MRIcroGL if necessary

if ! [ -x "$(command -v MRIcroGL)" ]; then
  echo 'MRIcroGL is not installed. Installing MRIcroGL...'
  START_DIR=${PWD}
  CODE_DIR=${START_DIR}/mricroglconf
  TMP_DIR=$(mktemp -d)

  cd ${TMP_DIR}
  curl -fLO https://github.com/rordenlab/MRIcroGL/releases/latest/download/MRIcroGL_linux.zip
  unzip MRIcroGL_linux.zip
  cp ${CODE_DIR}/startup.py MRIcroGL/Resources/script/.
  sudo cp -r -i MRIcroGL /usr/local/.
  cd ${START_DIR}
  rm -rf ${TMP_DIR}  
fi


#
# Create links for each of the config files
#

# make .zfunctions dir if not there yet
mkdir -p ${HOME}/.zfunctions
mkdir -p ${HOME}/.zthemes

mkdir -p ${HOME}/.config/helix

ln -svf "$(realpath zfunctions)"/search_zsh_history.sh ${HOME}/.zfunctions/search_zsh_history.sh

ln -svf "$(realpath configs)"/.zlogin ${HOME}/.zlogin
ln -svf "$(realpath configs)"/.zshenv ${HOME}/.zshenv
ln -svf "$(realpath configs)"/.zshrc ${HOME}/.zshrc

ln -svf "$(realpath configs)"/helix/config.toml ${HOME}/.config/helix/config.toml
ln -svf "$(realpath configs)"/helix/languages.toml ${HOME}/.config/helix/languages.toml

ln -svf "$(realpath themes)"/prompt_cliche_setup ${HOME}/.zthemes/prompt_cliche_setup

echo 'Done!'


#
# Set Zsh as the default shell lastly as it will require new shell
#
if ! [ "$SHELL" = "$(which zsh)" ]; then
  echo 'Setting Zsh as the default shell...'
  sudo chsh -s "$(which zsh)" "$USER"
fi
