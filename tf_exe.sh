#!/bin/bash

echo "started "`date`" "`date +%s`""

cp -rv /home/perdue/ANNMINERvA3/mnvtf .
cp -v /home/perdue/ANNMINERvA3/estimator_hadmult_simple.py .

EXE="estimator_hadmult_simple.py"
BATCH_SIZE=100
TRAIN_STEPS=5
NUM_EPOCHS=1

MODEL_DIR="/data/perdue/minerva/tensorflow/models/test"
DATA_DIR="/data/perdue/minerva/hdf5/test"
TRAIN_FILE="${DATA_DIR}/hadmultkineimgs_mnvvtx_train.hdf5"
EVAL_FILE="${DATA_DIR}/hadmultkineimgs_mnvvtx_test.hdf5"

ARGS="--batch-size ${BATCH_SIZE}"
# ARGS+=" --train-steps ${TRAIN_STEPS}"
ARGS+=" --num-epochs ${NUM_EPOCHS}"
ARGS+=" --train-file ${TRAIN_FILE}"
ARGS+=" --eval-file ${EVAL_FILE}"
ARGS+=" --model-dir ${MODEL_DIR}"


SNGLRTY="/data/perdue/singularity/gnperdue-singularity_imgs-master-py3_tf110.simg"

cat << EOF
singularity exec --nv $SNGLRTY python3 $EXE $ARGS
EOF
singularity exec --nv $SNGLRTY python3 $EXE $ARGS
