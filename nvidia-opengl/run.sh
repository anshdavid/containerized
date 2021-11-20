#!/bin/sh

# catch to Trap error code before exit
set -e
trap 'catch $?' EXIT
catch() {
    if [ "$1" != "0" ]; then
        echo ""
        echo "using exsisting container..."
        run_existing
    fi
}

run_build (){

    docker run -it --name odin \
    -u user \
    -v "/home/wolf/codebase/cpp/Physx:/home/user/workspace" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e DISPLAY=$DISPLAY \
    --gpus 0 \
    physx:0.1

    # -e XAUTHORITY=$XAUTH \
    # -v $XAUTH:$XAUTH \
    # --runtime=nvidia \
    # --device=/dev/dri \
    # --group-add video \
    echo "creating docker container..."

}

run_existing() {

    docker start odin
    docker attach odin
}

run_build