#!/bin/bash -e

# Copy installation script to host
cp /tmp/install.sh /host

# Give execute priv to script
/usr/bin/nsenter -t 1 -m -u -i -n -i -p -- chmod u+x /tmp/install/install.sh

# If the /tmp folder is mounted on the host then it can run the script
/usr/bin/nsenter -t 1 -m -u -i -n -i -p /tmp/install/install.sh

# Sleep so that the Pod in the DaemonSet does not exit
sleep infinity
