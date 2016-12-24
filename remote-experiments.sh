#!/bin/bash

ODIR=$1
DATASET=RCV1

./remote-update.sh
./connect.sh "./experiments.sh --n_trials=5 --output_dir=$ODIR --dataset=$DATASET"
./remote-download.sh $ODIR
python stats.py $ODIR
