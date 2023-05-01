
start=${PWD}
tmp=$(mktemp -d)
cd ${tmp}

# these are the dependencies I was missing on Ubuntu in the past,
# there might be others, or they might already be installed
sudo apt-get install libtool-bin
sudo apt-get install gnutls-bin
sudo apt-get install libgccjit-13-dev
sudo apt-get install libwebkit2gtk-4.0-dev
sudo apt-get install librsvg2-bin
sudo apt-get install librsvg2-dev

git clone git://git.savannah.gnu.org/emacs.git
cd emacs
git checkout emacs-28
./autogen.sh
./configure --with-json --with-modules --with-xwidgets --with-rsvg --without-pop && make && make install
