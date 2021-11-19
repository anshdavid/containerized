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

    echo "creating docker container..."

    docker run -it --name fenrir \
    -u user \
    -v "$(pwd):/home/user/fenrir" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    fenrir:latest
}

run_existing() {
    docker start fenrir
    docker attach fenrir
}

run_build