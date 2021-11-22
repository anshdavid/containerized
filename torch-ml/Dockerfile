FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="ansh1990@gmail.com"
LABEL version="0.1.0"
LABEL description="Image for PyTorch and Machine Learning"


RUN apt-get update && apt-get -y install \
    sudo \
    apt-utils \
    gnupg2 \
    wget \
    curl \
    lsb-release \
    software-properties-common \
    # python3-pip \
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

RUN conda update --all

COPY requirements.txt /tmp/

RUN conda install --file /tmp/requirements.txt

RUN conda clean --yes --all

RUN pip3 install pyglet gekko opencv-python dlib pytesseract

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user \
    && adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user \
    && adduser user sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user

WORKDIR /home/user/workspace

RUN export PATH="/home/user/.local/bin:$PATH"