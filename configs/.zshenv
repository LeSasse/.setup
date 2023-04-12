#
# Set environment variables for zsh
#

# RUST
export RUSTFLAGS="-Ctarget-cpu=native"

# Editors
export VISUAL=hx
export EDITOR="$VISUAL"
export GIT_EDITOR=hx

# Set the list of directories that Zsh searches for programs.
path=(
    $DOTFILES/bin
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
    /usr/X11R6/bin
    /usr/local/games
    /usr/games
    /usr/local/MRIcroGL
    $path
)

# make our theme discoverable
fpath=(
    $HOME/.zthemes
    $fpath
)

# load environment modules, if present
! type module > /dev/null 2>&1 && [ -f /etc/profile.d/modules.sh ] && source /etc/profile.d/modules.sh

# mouse-wheel scrolling is disabled by -X (disable screen clearing).
# Remove both -X and -F (exit if the content fits on one screen) to re-enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

export CLICHE_GIT_CHECK_FOR_CHANGES=staged