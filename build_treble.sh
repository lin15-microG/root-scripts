#!/bin/bash

# Own values
export CCACHE_DIR=~/android/.ccache15
export OUT_DIR_COMMON_BASE=~/out-android

# Use pre-defined build script
source z_patches/build_treble.sh $1 $2 $3



