#!/bin/bash

SCRIPTKEY=`date +%s`
mkdir job${SCRIPTKEY}

cat << EOF
sbatch --gres=gpu:${NGPU} --nodelist=${NODES} -A minervag -p gpu job${SCRIPTKEY}.sh
EOF

# do the thing, etc.
cp tf_exe.sh job${SCRIPTKEY}
pushd job${SCRIPTKEY}
sbatch --gres=gpu:${NGPU} --nodelist=${NODES} -A minervag -p gpu tf_exe.sh
popd
