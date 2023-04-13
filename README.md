# Set me up

Collection of configuration files and scripts to set me up on Kubuntu.

## Update:

Quick reminder to update if I want to:
```sh
sudo apt update && sudo apt upgrade
```
Add backports to get latest KDE:
```sh
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo apt full-upgrade
```
## Install git and zsh:
```sh
sudo apt-get install -y git zsh
```
## Install helix
I like using [helix](https://helix-editor.com/) as a text editor:
```
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix
```
## Set up my dotfiles:
```sh
./scripts/setup_dotfiles.sh 
```
## Change default shell to zsh:
```sh
sudo chsh -s "/usr/bin/zsh" "$USER"
```
Remember to start a new terminal at this point

# Additional nice to have software

## Set up my base python installation
```sh
./scripts/setup_python.sh
```
## Install MRIcroGL
```sh
./scripts/setup_mricrogl.sh
```