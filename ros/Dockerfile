FROM osrf/ros:melodic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

LABEL maintainer="ansh1990@gmail.com"
LABEL version="0.2.0"
LABEL description="ROS docker + GUI"


RUN apt-get update && apt-get -y install \
    sudo \
    apt-utils \
    gnupg2 \
    wget \
    curl \
    lsb-release \
    software-properties-common \
    build-essential \
    make \
    gdb \
    openssh-server \
    gdbserver \
    libnss3-dev \
    valgrind \
    libssl-dev \
    cmake \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install \
    ros-melodic-rosapi \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user \
    && adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user \
    && adduser user sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user

WORKDIR /home/user/catkin_ws

# RUN conda init bash
