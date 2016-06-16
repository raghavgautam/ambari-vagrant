#!/bin/bash
NUM_MACHINES=3
MACHINES=$(eval echo c640{1..${NUM_MACHINES}}.ambari.apache.org)
echo bringing up $MACHINES
./up.sh ${NUM_MACHINES}
#exec vagrant ssh c6401
osascript -e 'display notification "Open commandline for next steps." with title "Ambari vagrant is ready"' &

echo Going to copy following machine details for ambari to clipboard && echo ${MACHINES} | tr ' ' '\n'
echo "Press enter to continue" && read
echo  "${MACHINES}" | tr ' ' '\n' | pbcopy

echo opening ambari ui && sleep 5 && open "http://c6401.ambari.apache.org:8080/"
echo "Going to copy ssh key to clipboard" && read
pbcopy <insecure_private_key
