envyfile-docker
===============

Envyfile for docker investigation

## Usage

#### Initial install

To boot a node capable of running docker containers, run:

    envy up

First time through, it will install the required linux kernel (3.8).  After installing, it will reboot.  You will need to run:

    envy up

again to continue provisioning docker.

#### Running docker-registry

Run:

    sudo docker run -i -t samalba/docker-registry

This will pull down the docker-registry container from the public docker registry.