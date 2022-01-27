#!/bin/sh

docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t rosdocker:0.2 .