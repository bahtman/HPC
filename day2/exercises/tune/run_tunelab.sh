#!/bin/sh
### -- set the job Name --
#BSUB -J tunelab
### –- specify queue --
#BSUB -q hpcintro
### -- ask for number of cores (default: 1) --
#BSUB -n 1
### -- set walltime limit: hh:mm --
#BSUB -W 5
### -- specify that we need 2GB of memory per core/slot -- 
#BSUB -R "rusage[mem=1GB]"
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o Output_%J.out
#BSUB -e Error_%J.err
module load gcc/9.2.0
CC=${1-"gcc"}

NPARTS="2000 3000 4000 5000 7500 10000 20000 40000 80000 200000 400000 800000 1200000 1600000 3000000"
LOOPS=1000
LOGEXT=$CC.dat

/bin/rm -f aos.$LOGEXT soa.$LOGEXT
for particles in $NPARTS
do
    ./aos.${CC} $LOOPS $particles | grep -v CPU >> aos.$LOGEXT
    ./soa.${CC} $LOOPS $particles | grep -v CPU >> soa.$LOGEXT
done

# time to say 'Good bye' ;-)
#
exit 0

