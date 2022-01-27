> export containerId=$(docker ps -l -q)

### for the lazy and reckless
    xhost +local:root
    xhost -local:root

###  opening up xhost for specific system
    xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId`