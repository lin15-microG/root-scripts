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
  microG) BRANCH="lin-15.1-microG"
    ;;
  default) BRANCH="lineage-15.1"
    ;;
  *) echo "usage: switch_microg default|microG"
     exit
    ;;   
esac

switch_zpatch $BRANCH R

switch_branches $BRANCH frameworks/base
switch_branches $BRANCH frameworks/native
switch_branches $BRANCH kernel/oneplus/msm8996/
switch_branches $BRANCH packages/apps/Camera2
switch_branches $BRANCH packages/apps/Dialer
switch_branches $BRANCH packages/apps/Eleven
switch_branches $BRANCH packages/apps/Jelly
switch_branches $BRANCH packages/apps/Settings
switch_branches $BRANCH packages/apps/Trebuchet
switch_branches $BRANCH system/core
switch_branches $BRANCH system/sepolicy
switch_branches $BRANCH vendor/lineage
switch_branches $BRANCH .repo/local_manifests

switch_zpatch $BRANCH S

