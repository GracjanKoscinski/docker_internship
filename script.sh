#!/bin/bash

PLAYBOOK=$1

ANSIBLE_VERSION_1="2.14.13"
ANSIBLE_VERSION_2="2.16.2"

docker build --build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION_1} -t ansible_image_2.14.13 .
docker build --build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION_2} -t ansible_image_2.16.2 .

docker run --rm -v "$PWD:/home" ansible_image_2.14.13 "/home/$PLAYBOOK"
docker run --rm -v "$PWD:/home" ansible_image_2.16.2 "/home/$PLAYBOOK"

