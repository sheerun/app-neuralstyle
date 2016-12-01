#!/bin/bash

if [ GPU_COUNT -lt 1 ]; then
    GPU_ARGS="-gpu -1"
fi

OUTDIR=/data/NeuralStyle
mkdir -p $OUTDIR

cd /usr/local/neural-style/neural-style

exec th neural_style.lua  ${GPU_ARGS} -style_image "$1" -content_image "$2" -output_image "${OUTDIR}/${JOB_NAME}.png"
