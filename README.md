envyfile-docker
===============

Envyfile for docker investigation

## Usage

#### Initial install

To boot a node capable of running docker containers, run:

    envy up

First time through, it will install the required linux kernel (3.8).  After installing, it will reboot.  You will need to run:

    envy up

again to continue provisioning docker.  This instance adds the ubuntu user to the docker group, so you don't need to run sudo for docker commands.

#### Running docker-registry

Run:

    docker run -i -t samalba/docker-registry

This will pull down the docker-registry container from the public docker registry.