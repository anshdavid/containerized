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

    docker run -it --name obsidian \
    -u user \
    -v "$(pwd):/home/user/workspace" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $XAUTH:$XAUTH \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e XAUTHORITY=$XAUTH \
    --runtime=nvidia \
    --gpus 0 \
    --shm-size=2g \
    xcog:0.1

    echo "creating docker container..."

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