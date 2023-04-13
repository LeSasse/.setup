#
# executed at login, post-zshrc
#

# compile in the background
{
  # compile the completion dump to increase startup speed.
  zcompdump="${HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

