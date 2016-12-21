#!/bin/bash

## parameters
### defualts
N_TRIALS=1
RUN_NAME=no_run_name

### parse
for i in "$@"
do
case $i in
    -nt=*|--n_trials=*)
    N_TRIALS="${i#*=}"
    shift # past argument=value
    ;;
    -c=*|--command=*)
    COMMAND="${i#*=}"
    shift # past argument=value
    ;;
    -od=*|--output_dir=*)
    ODIR="${i#*=}"
    shift # past argument=value
    ;;
    -rn=*|--run_name=*)
    RUN_NAME="${i#*=}"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *) # unknown option
    echo "unknown option: \"$i\""
    exit 1 
    ;;
esac
done

echo "Running \"$COMMAND\" for $N_TRIALS times."

exp_timestamp=$(date +%s)
odir=$ODIR/$RUN_NAME/$exp_timestamp

mkdir -p $odir
for (( i=1; i<=$N_TRIALS; i++ ))
do
    echo "trial #$i.."

    timestamp=$(date +%s)

    echo $COMMAND > $odir/command.sh
    $COMMAND > $odir/$timestamp.log
done
