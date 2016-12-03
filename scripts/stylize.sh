#!/bin/bash

if [ -r /etc/JARVICE/jobinfo.sh ]; then
    . /etc/JARVICE/jobinfo.sh
fi

if [ -r /etc/JARVICE/jobenv.sh ]; then
    . /etc/JARVICE/jobenv.sh
fi

STYLE_IMAGE="$1"
CONTENT_IMAGE="$2"
GPU_COUNT="$3"

if [ $GPU_COUNT -lt 1 ]; then
    GPU_ARGS="-gpu -1"
fi

OUTDIR=/data/NeuralStyle
mkdir -p $OUTDIR

cd /usr/local/neural-style/neural-style

exec th neural_style.lua  ${GPU_ARGS} -style_image ${STYLE_IMAGE} -content_image ${CONTENT_IMAGE} -output_image "${OUTDIR}/${JOB_NAME}.png"
