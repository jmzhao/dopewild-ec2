#!/bin/bash

ODIR=$1

./remote-update.sh
./connect.sh "./experiments.sh --n_trials=5 --output_dir=$ODIR"
./remote-download.sh $ODIR
python stats.py $ODIR
