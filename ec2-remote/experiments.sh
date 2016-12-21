#!/bin/bash

## parameters
### defualts
ODIR=stats

### parse
for i in "$@"
do
case $i in
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

for n_thread in {256,64,16,4,1}
do
#./run.sh \
#--n_trials=$N_TRIALS \
#--output_dir=$ODIR \
#--run_name=svm/example_data/$n_thread \
#--command="dopewild/bin/svm --splits $n_thread --stepinitial 0.1 --step_decay 0.9 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv"
#
./run.sh \
--n_trials=$N_TRIALS \
--output_dir=$ODIR \
--run_name=cfsvm/example_data/$n_thread \
--command="dopewild/bin/cfsvm --splits $n_thread --stepinitial $(python -c "print(0.1*$n_thread**.5)") --step_decay $(python -c "print(0.9*$n_thread**(.5*-1/20))")  --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv"
done
