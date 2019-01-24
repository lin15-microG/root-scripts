#!/bin/bash

switch_branches() {
  TOPDIR=$PWD
  cd $2
  echo "-"
  echo "$PWD"
  git checkout $1
  cd $TOPDIR
}

switch_zpatch() {
  TOPDIR=$PWD
  cd z_patches
  echo "-"
  echo "$PWD"
  case "$2" in 
    R) ./patches_reverse.sh
       git checkout $1
       ;;
    S) ./patches_apply.sh  
       ;;
  esac
  cd $TOPDIR
}

case "$1" in
  microG) 
    BRANCH1="lin-15.1-microG"
    BRANCH2="lin-15.1-microG"
    PATCHV="S"
    ;;
  default) 
    BRANCH1="lineage-15.1"
    BRANCH2="lin-15.1-microG"
    PATCHV="S"
    ;;
  reference) 
    BRANCH1="lineage-15.1"
    BRANCH2="lineage-15.1"
    PATCHV="N"
    ;;
  *) 
    echo "usage: switch_microg.sh default | microG | reference"
    echo "-"
    echo "  default   - LineageOS 15.1 (with patches and fixed repos)"
    echo "  microG    - hardened microG build"
    echo "  reference - 100% LineageOS 15.1 (no patches - for 'repo sync')"
    exit
    ;;   
esac

switch_zpatch $BRANCH1 R

switch_branches $BRANCH1 frameworks/base
switch_branches $BRANCH1 frameworks/native
switch_branches $BRANCH1 kernel/oneplus/msm8996/
switch_branches $BRANCH1 packages/apps/Camera2
switch_branches $BRANCH1 packages/apps/Dialer
switch_branches $BRANCH2 packages/apps/Eleven
switch_branches $BRANCH2 packages/apps/LockClock
switch_branches $BRANCH1 packages/apps/Jelly
switch_branches $BRANCH1 packages/apps/Settings
switch_branches $BRANCH1 packages/apps/SetupWizard
switch_branches $BRANCH1 packages/apps/Trebuchet
switch_branches $BRANCH2 system/bt
switch_branches $BRANCH1 system/core
switch_branches $BRANCH1 system/sepolicy
switch_branches $BRANCH1 vendor/lineage
switch_branches $BRANCH1 .repo/local_manifests

switch_zpatch $BRANCH1 $PATCHV

