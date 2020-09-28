# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# extend display to "HD"
COUNT_DISPLAY=$(xrandr | grep -w 'connected' | wc -l)

if [ $COUNT_DISPLAY \> 1 ]; then
  EXT_DISPLAY=$(xrandr | grep -w 'connected' | grep -vw 'primary' | grep -oE '[^ ]+')

  xrandr --newmode "hd" $(cvt 1366 768 60 | grep 60 | grep -oE '[^"\S]*$')
  xrandr --addmode $EXT_DISPLAY "hd"
  xrandr --output $EXT_DISPLAY --mode "hd" --primary
else
  $SHELL -c 'echo "only one monitor connected"; read'
fi

xmodmap ~/.Xmodmap

