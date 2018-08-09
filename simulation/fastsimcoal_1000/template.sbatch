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
module load parallel
#module load java
#module load python 
#python ./CrossMap-0.2.5/bin/CrossMap.py vcf AGPv2_to_AGPv3.chain.gz maize600k_eliteLines.vcf ../AGPv3/Zea_mays.AGPv3.22.dna.genome.fa maize600k_eliteLines_v3.vcf

./ManyItersScript2.sh
parallel --jobs 8 --sshloginfile <(scontrol show hostname) --joblog fsc_progress_00.log --workdir $PWD < fsc.cmds

#ssh condo "qstat -f ${SLURM_JOB_ID} |head"

