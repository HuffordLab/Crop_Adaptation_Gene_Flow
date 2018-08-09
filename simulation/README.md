# This repo contains scripts utilized for simulation in the manuscript.

We first simulated a demography with two populations. They split at their ancestry. 
One population went through a domestication bottleneck, and the other population didnot change its Ne.
After domestication, the wild relative introgressed into the domesticated population.

We simulated the demography with ms, and then we utilized the 2dsfs of the simulated data to fit into a model with two population but without introgression in fastsimcoal.
In the fastsimcoal model, we fixed the ancestral Ne the same as what we simulated, but estimated the timing of onset of bottleneck and Ne at bottleneck.
We then compared if we neglect the effect of introgression, how it affects our estimate of Ne at bottleneck and the onset timing of bottleneck. 

## submit the ms.sbatch file.

It contains the ms.sh (simulation details) and how we utilized ANGSD to convert simualated sequences into 2dsfs.

## convert Angsd 2dsfs to the format, which fastsimcoal can read.

angsd2dsfs_to_FSC2dsfs.R

## In fastsimcoal_1000, it contains scripts for 1000 repetition of the estimate.

NPlantsModel.est and NPlantsModel.tpl set up parameter and demography.
ManyItersScript2.sh generates 1000 subfolders to restore the result.
submit template.sbatch, which executes fsc.cmds (fastsimcoal command).

## compile the results
for f in result.*/NPlantsModel/NPlantsModel.bestlhoods
do sed '1d' $f | cat - >> test.txt
done

head -1 ./result.1/NPlantsModel/NPlantsModel.bestlhoods > header.txt

cat header.txt test.txt > result.txt
