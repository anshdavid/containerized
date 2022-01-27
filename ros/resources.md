- https://wiki.ros.org/docker/Tutorials/GUI
- https://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration
- https://gist.github.com/ruffsl/e7ca631a618ece3eb0be8e4bf168accb


    export containerId=$(docker ps -l -q)
## for the lazy and reckless
    xhost +local:root
    xhost -local:root

##  opening up xhost for specific system
    xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId`