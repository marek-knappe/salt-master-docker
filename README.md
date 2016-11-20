# Docker Salt-Master

This is docker image to run salt-master in container. You can persist all configs by using external volumes

## Running the Container

Just run:
```
# docker build -t salt-master . 
# docker run -d --name salt-master   -v /opt/salt-master/var/cache/salt:/var/cache/salt -v /opt/salt-master/etc/salt:/etc/salt -v /opt/salt-master/var/log/salt:/var/log/salt -v /opt/salt-master/root/ssh:/root/.ssh -v /opt/salt-master/srv:/srv -p 4505:4505 -p 4506:4506 salt-master
```

## Ports

The following ports are exposed:

 * `4505`
 * `4506`

## Running Salt Commands


The simplest way is just to enter the container:
```
# docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                          NAMES
1f3a28c7ef9c        salt-master         "/usr/bin/supervisord"   4 days ago          Up 19 seconds       0.0.0.0:4505-4506->4505-4506/tcp               salt-master
(... grab id of container ...)

# docker exec -i -t (ID) /bin/bash

