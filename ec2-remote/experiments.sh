#!/bin/bash

DATASET_CMD_RCV1="--binary 1 data/RCV1.train.bin data/RCV1.test.tsv"
DATASET_CMD_Year="--binary 0 data/Year.train.tsv data/Year.test.tsv"

## parameters
### defualts
DATASET=RCV1
DATASET_CMD=$DATASET_CMD_RCV1
N_TRIALS=1
ODIR=stats

### parse
for i in "$@"
do
case $i in
    -d=*|--dataset=*)
    DATASET="${i#*=}"
    case $DATASET in
        RCV1)
	DATASET_CMD=$DATASET_CMD_RCV1
	;;
        Year)
	DATASET_CMD=$DATASET_CMD_Year
	;;
	*)
	echo "unknown dataset: $DATASET"
	echo "supported are: RCV1, Year."
	exit 1
        ;;
    esac
    shift # past argument=value
    ;;
    -nt=*|--n_trials=*)
    N_TRIALS="${i#*=}"
    shift # past argument=value
    ;;
    -od=*|--output_dir=*)
    ODIR="${i#*=}"
    shift # past argument=value
    ;;
    *) # unknown option
    echo "unknown option: \"$i\""
    exit 1
    ;;
esac
done

echo "output to '$ODIR'"

for n_thread in {256,64,16,4,1}
do
#./run.sh \
#--n_trials=$N_TRIALS \
#--output_dir=$ODIR \
#--run_name=svm/$DATASET/$n_thread \
#--command="dopewild/bin/svm --splits $n_thread --stepinitial 0.1 --step_decay 1 --mu 1 $DATASET_CMD"
#

n_epoch=20 #$(python -c "from math import log;print(max(10,$n_thread*int(log($n_thread,2))))")
step_initial=$(python -c "print(0.1*$n_thread**.5)")
step_decay=$(python -c "print(0.9*$n_thread**(.5*-1/20))")

./run.sh \
--n_trials=$N_TRIALS \
--output_dir=$ODIR \
--run_name=cfsvm/$DATASET/$n_thread \
--command="dopewild/bin/cfsvm --epochs $n_epoch --splits $n_thread --stepinitial $step_initial --step_decay $step_decay --mu 1 $DATASET_CMD"
done
