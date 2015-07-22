#!/bin/zsh

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

docker run --rm -i -t \
  -e DISPLAY=$DISPLAY \
  -e XAUTHORITY=$XAUTHORITY \
  -v $XSOCK:$XSOCK \
  -v $XAUTH:$XAUTH \
  -v /run/user/$UID:/run/user/$UID \
  --device=/dev/dri/card0:/dev/dri/card0 \
  steam-ubuntu bash
