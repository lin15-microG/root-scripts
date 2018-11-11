#!/bin/bash

# Own values
export CCACHE_DIR=~/.ccache15
export OUT_DIR_COMMON_BASE=~/out-android

# Use pre-defined build script
CDIR=$PWD
cd device/sony/amami
git checkout lineage-15.1
cd $CDIR

source z_patches/build_amami.sh $1



