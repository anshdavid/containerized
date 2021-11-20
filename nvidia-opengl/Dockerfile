FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="ansh1990@gmail.com"
LABEL version="0.1.0"
LABEL description="Image for Nvidia Physx, no gpu acceleration"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install \
    sudo \
    apt-utils \
    gnupg2 \
    wget \
    curl \
    lsb-release \
    software-properties-common \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install \
    build-essential \
    make \
    gdb \
    valgrind \
    libssl-dev \
    cmake \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

RUN apt-get update && apt-get -y install \
    libglm-dev cmake libxcb-dri3-0 libxcb-present0 libpciaccess0 \
    libpng-dev libxcb-keysyms1-dev libxcb-dri3-dev libx11-dev g++ gcc g++-multilib \
    libmirclient-dev libwayland-dev libxrandr-dev libxcb-randr0-dev libxcb-ewmh-dev \
    git python3 bison libx11-xcb-dev liblz4-dev libzstd-dev \
    autotools-dev libicu-dev libbz2-dev libboost-all-dev \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install \
    libxxf86vm-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    gcc-multilib \
    g++-multilib \
    lib32z1 \
    freeglut3-dev \
    mesa-common-dev \
    libxdamage1 \
    libxmu-dev \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user \
    && adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user \
    && adduser user sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user

WORKDIR /home/user/workspace