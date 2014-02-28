#!/bin/sh

# The X server may not be running
if [ ! -d /tmp/.X11-unix ]
then
  exit 0
fi

# Configure each available display
for socket in $(ls /tmp/.X11-unix)
do
  display=$(echo "$socket" | tr "X" ":")

  echo "update xrandr configuration for $display"
  export DISPLAY="$display"

  # I don't know which user own which X session
  # and I cannot use 'who' neither.
  for user in $(ls /home)
  do
    su $user -c "autorandr -c"
  done
done
unset DISPLAY
