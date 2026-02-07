FROM osrf/ros:humble-desktop-full

# WORKDIR /ws

ARG USER=jasonwu
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USER} \
 && useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USER} \ 
 && echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions \
    terminator \
    ros-humble-moveit* \
    && rm -rf /var/lib/apt/lists/*

# COPY src/ /ws/src/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER ${USER}

WORKDIR /work

ENTRYPOINT ["/entrypoint.sh", "terminator"]
# CMD ["talker"]
