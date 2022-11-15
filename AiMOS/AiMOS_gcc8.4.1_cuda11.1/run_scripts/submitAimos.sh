#!/bin/bash
nodes=1
ppn=4
set -x
sbatch -N $nodes -n $((nodes*ppn)) -t 30 --gres=gpu:$ppn ./runAimos.sh
set +x
