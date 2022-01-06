#!/bin/bash
# 02614 - High-Performance Computing, January 2022
# 
# batch script to run matmult on a decidated server in the hpcintro
# queue
#
# Author: Bernd Dammann <bd@cc.dtu.dk>
#
#BSUB -J blkperf
#BSUB -q hpcintro
#BSUB -n 1
#BSUB -R "rusage[mem=2048]"
#BSUB -W 15
# uncomment the following line, if you want to assure that your job has
# a whole CPU for itself (shared L3 cache)
#BSUB -R "span[hosts=1] affinity[socket(1)]"
module load gcc
# define the driver name to use
# valid values: matmult_c.studio, matmult_f.studio, matmult_c.gcc or
# matmult_f.gcc
#
EXECUTABLE=matmult_c.gcc

# define the mkn values in the MKN variable
#
SIZES="9 12 18 25 36 51 73 103 146 206 292 413 584 826 1168 1652 2336 3304"

# define the permutation type in PERM
#
PERM="blk"

# uncomment and set a reasonable BLKSIZE for the blk version
#
BLKSIZE=7

# enable(1)/disable(0) result checking
export MATMULT_COMPARE=0
export MATMULT_RESULTS=0

/bin/rm -f blk.dat

# start the collect command with the above settings
for S in $SIZES
do
    ./$EXECUTABLE $PERM $S $S $S $BLKSIZE | grep -v CPU >> blk_perf.dat
done
