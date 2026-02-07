#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="ros2_moveit_prac"

if ! docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
  docker build -t "$IMAGE_NAME" .
fi


docker run --rm \
  --gpus all \
  --privileged \
  --volume /home/jasonwu/docker_ws:/work \
  -v /dev:/dev \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /tmp/.Xauthority:/home/${USER}/.Xauthority \
  --env XAUTHORITY=/home/${USER}/.Xauthority \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -it "$IMAGE_NAME"