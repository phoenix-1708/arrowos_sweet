#!/bin/bash
#
# Copyright (c) 2021 CloudedQuartz
#

# Script to set up environment to build an android kernel
# Assumes required packages are already installed

# Config
CURRENT_DIR="$(pwd)"
KERNELNAME="PhoenixKernel_arrow"
KERNEL_DIR="$CURRENT_DIR"
AK_REPO="https://github.com/phoenix-1708/AnyKernel3"
AK_BRANCH="sweet"
AK_DIR="$HOME/AnyKernel3"
TC_DIR="$HOME/proton-clang"
TC_DIR64="$HOME/gcc"
TC_DIR32="$HOME/gcc32"
# End Config

# clone_tc - clones proton clang to TC_DIR
clone_tc() {
	git clone --depth=1 https://github.com/sohamxda7/llvm-stable $TC_DIR
	git clone --depth=1 https://github.com/sohamxda7/llvm-stable -b gcc64 $TC_DIR64
	git clone --depth=1 https://github.com/sohamxda7/llvm-stable -b gcc32 $TC_DIR32
}

# Clones anykernel
clone_ak() {
	git clone $AK_REPO $AK_DIR -b $AK_BRANCH
}
# Actually do stuff
clone_tc
clone_ak

# Run build script
. ${CURRENT_DIR}/kernel_build.sh
