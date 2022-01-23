#!/bin/sh

# VERSION=0.1.0

docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t xcog:0.1 .