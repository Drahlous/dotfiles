#!/bin/bash

docker run --rm --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor:unconfined -it dot-docker
