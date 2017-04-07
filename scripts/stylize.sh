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
EXTRA_ARGS="$4"

if [ $GPU_COUNT -lt 1 ]; then
  GPU_ARGS="-gpu -1"
fi

OUTDIR=/data/NeuralStyle
mkdir -p "$OUTDIR/$JOB_NAME"

export STYLE_PATH="${OUTDIR}/${JOB_NAME}/sytle.jpg"
export CONTENT_PATH="${OUTDIR}/${JOB_NAME}/content.jpg"
export OUTPUT_PATH="${OUTDIR}/${JOB_NAME}/output.jpg"

curl -sLo "$STYLE_PATH" "$STYLE_IMAGE"
curl -sLo "$CONTENT_PATH" "$CONTENT_IMAGE"

cd /usr/local/neural-style/neural-style
. /usr/local/torch/install/bin/torch-activate


exec th neural_style.lua ${GPU_ARGS} ${EXTRA_ARGS} \
  -style_image "${STYLE_PATH}" \
  -content_image "${CONTENT_PATH}" \
  -output_image "${OUTPUT_PATH}"

export OUTPUT_URL=$(curl --upload-file "${OUTPUT_PATH}" https://transfer.sh/output.jpg)

echo "FINALRESULT:$OUTPUT_URL"
