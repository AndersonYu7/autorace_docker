#!/usr/bin/env bash

# Get dependent parameters
source "$(dirname "$(readlink -f "${0}")")/get_param.sh"

docker run --rm \
    --privileged \
    --network=host \
    --ipc=host \
    --runtime nvidia \
    -v /tmp/.Xauthority:/home/"${user}"/.Xauthority \
    -e XAUTHORITY=/home/"${user}"/.Xauthority \
    -e DISPLAY="${DISPLAY}" \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    --device /dev/video0:/dev/video0 \
    -v "${WS_PATH}":/home/"${user}"/work \
    -it --name "detect" "${DOCKER_HUB_USER}"/"detect"

# ${GPU_FLAG} \
# --runtime nvidia \
#--user root \ 

