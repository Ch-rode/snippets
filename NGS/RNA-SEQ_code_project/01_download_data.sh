#!/usr/bin/env bash

WORKDIR=$1 # e.g., ~project/group_work/group5/Alice
DATAPATH=$2 # e.g., ~project/group_work/group5/data

mkdir -p $WORKDIR $DATAPATH

cd $DATAPATH

wget https://ngs-introduction-training.s3.eu-central-1.amazonaws.com/project3.tar.gz
tar -xvf project3.tar.gz
rm project3.tar.gz

