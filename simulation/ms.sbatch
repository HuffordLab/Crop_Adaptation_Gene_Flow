#!/bin/bash
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=96:00:00
#SBATCH --job-name=R
#SBATCH --output=R_%j.out 
#SBATCH --error=R_%j.err
#SBATCH --mail-user=lilepisorus@gmail.com   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END

cd $SLURM_SUBMIT_DIR
ulimit -s unlimited
./ms.sh
/work/LAS/mhufford-lab/lwang/bin/angsd/angsd/misc/msToGlf -in msoutput -out raw -singleOut 1 -regLen 0 -depth 6 -err 0.005
/work/LAS/mhufford-lab/lwang/bin/angsd/angsd/misc/splitgl raw.glf.gz 30 1 15 > pop1.glf.gz
/work/LAS/mhufford-lab/lwang/bin/angsd/angsd/misc/splitgl raw.glf.gz 30 16 30 > pop2.glf.gz
/work/LAS/mhufford-lab/lwang/bin/angsd/angsd/angsd -glf pop1.glf.gz -nInd 15 -doSaf 1 -out pop1 -fai /work/LAS/mhufford-lab/lwang/AGPv4/Zea_mays.AGPv4.dna.toplevel.fa.fai -isSim 1
/work/LAS/mhufford-lab/lwang/bin/angsd/angsd/angsd -glf pop2.glf.gz -nInd 15 -doSaf 1 -out pop2 -fai /work/LAS/mhufford-lab/lwang/AGPv4/Zea_mays.AGPv4.dna.toplevel.fa.fai -isSim 1

/work/LAS/mhufford-lab/lwang/bin/angsd/angsd/misc/realSFS pop1.saf.idx pop2.saf.idx -P 16 > pop12.sim.2dsfs

#ssh condo "qstat -f ${SLURM_JOB_ID} |head"

