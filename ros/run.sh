#!/bin/sh

# catch to Trap error code before exit
set -e
trap 'catch $?' EXIT
catch() {
    if [ "$1" != "0" ]; then
        echo ""
        echo "using exsisting container..."
        # run_existing
        docker start obsidian
        docker attach obsidian
    fi
}

run_build (){

    echo "creating docker container..."

    docker run -it -u user -v "$(pwd):/home/user/catkin_ws" -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v $XAUTH:$XAUTH -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -e XAUTHORITY=$XAUTH --gpus 0 --shm-size=2g --name obsidian rosdocker:0.2

}

XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

run_build