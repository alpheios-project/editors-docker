#!/bin/sh

# make sure exist is good and stopped and stale pid file gone
/opt/exist/tools/wrapper/bin/exist.sh stop
# make sure exist is started
/opt/exist/tools/wrapper/bin/exist.sh start
# restore the apps
/opt/exist/bin/backup.sh -u admin -p admin -r /tmp/treebank.zip
/opt/exist/bin/backup.sh -u admin -p admin -r /tmp/alignment.zip
/opt/exist/bin/backup.sh -u admin -p admin -r /tmp/utils.zip
/opt/exist/bin/backup.sh -u admin -p admin -r /tmp/cts.zip
/opt/exist/bin/backup.sh -u admin -p admin -r /tmp/trees.zip

# make sure exist is good and stopped and stale pid file gone
/opt/exist/tools/wrapper/bin/exist.sh stop
