#!/bin/bash

. /usr/local/torch/install/bin/torch-activate

luarocks install cutorch
luarocks install cunn
luarocks install cudnn
