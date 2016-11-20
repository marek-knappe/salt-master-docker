#!/bin/bash
docker run -d --name salt-master   -v /opt/salt-master/var/cache/salt:/var/cache/salt -v /opt/salt-master/etc/salt:/etc/salt -v /opt/salt-master/var/log/salt:/var/log/salt -v /opt/salt-master/root/ssh:/root/.ssh -v /opt/salt-master/srv:/srv -p 4505:4505 -p 4506:4506 salt-master
