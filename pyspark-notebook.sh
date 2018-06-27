#!/bin/bash

ABSOLUTE=$(realpath $0)
WORK_DIR=$(dirname ${ABSOLUTE})

export OUT_DIR=${WORK_DIR}/dataOut
export IN_DIR=${WORK_DIR}/dataIn

# VIRTUAL_ENV variable will be set if virtual env is activated.
if [ -z $VIRTUAL_ENV ];
then
	echo "Loading python virtualenv..."
	source ${WORK_DIR}/sparkvenv/bin/activate
fi

# Only required if SPARK_HOME is not set and added to PATH
#export SPARK_HOME=/opt/spark
#export PATH=$PATH:$SPARK_HOME/bin

export PYSPARK_DRIVER_PYTHON=ipython
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'

#pyspark \
#  --master spark://deepakt-OptiPlex-9020:7077 \
#  --driver-memory 2g 
pyspark \
  --master local[*] \
  --driver-memory 2g 
