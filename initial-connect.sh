#!/bin/bash

./remote-update.sh
./connect.sh -t "chmod 777 setup.sh; sudo ./setup.sh; exec $SHELL -l"

