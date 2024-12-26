podman run --ulimit nofile=65536:65536 --name bioinfo01 -it centos:7 /bin/bash

podman run --ulimit host -v /home/database:/database:Z --name sprint -it 6b03ceb18d9c  /bin/bash
