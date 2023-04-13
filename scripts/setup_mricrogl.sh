#!/usr/bin/sh

# check where we are
base=$(basename $PWD)
if [ "${base}" = ".setup" ]; then
  configs_path=$(realpath configs)
elif [ "${base}" = "scripts" ]; then
  configs_path=$(realpath ../configs)
fi

if ! [ -x "$(command -v MRIcroGL)" ]; then
  echo 'MRIcroGL is not installed. Installing MRIcroGL...'
  START_DIR=${PWD}
  TMP_DIR=$(mktemp -d)

  cd ${TMP_DIR}
  curl -fLO https://github.com/rordenlab/MRIcroGL/releases/latest/download/MRIcroGL_linux.zip
  unzip MRIcroGL_linux.zip
  cp ${configs_path}/mricrogl_startup.py MRIcroGL/Resources/script/.
  sudo cp -r -i MRIcroGL /usr/local/.
  cd ${START_DIR}
  rm -rf ${TMP_DIR}
else
  echo 'MRIcroGL is already installed under $(command -v MRIcroGL)'
fi

