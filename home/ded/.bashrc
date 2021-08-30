##### 1st commented out 'PS1' line - original.

##### 2nd commented out 'PS1' line - If you hate the prompt with PWD when working
##### in deep-deep directory, then find this operator and just remove substring
##### '\w' from PS1 variable.

##### 3rd uncommented 'PS1' line and $HOSTN setting - Uppercase style
##### for root prompt.

HOSTN=`/usr/bin/hostname -s | /usr/bin/tr '[:lower:]' '[:upper:]'`

if [ "$color_prompt" = yes ]; then
    ##### PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ##### PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@$HOSTN\[\033[00m\]:\[\033[01;34m\]\[\033[00m\]\$ '
else
    ##### PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ##### PS1='${debian_chroot:+($debian_chroot)}\u@\h:\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@$HOSTN:\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    ##### PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ##### PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \a\]$PS1"
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@$HOSTN: \a\]$PS1"
    ;;
*)
    ;;
esac
