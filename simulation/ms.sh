#!/bin/bash
nSeq=60 #40 haplotypes
length=1000000 #simulate sequence length 10 Mb, similar to the length of one chromosome in maize, and will repeat 10 times
N=500000 # wild Ne
mu=$(echo "3*10 ^ -8" | bc -l) # mutation rate
theta=$( echo "4*$N*$mu*$length" | bc -l )  # assume rho = theta

#domestication bottleneck
dbneck_N=10000 # Ne during domestication bottleneck, 0.02*N.anc
dbneck_onset=10000 #generations ago
dbneck_recover=9000 #generations ago
divergence=60000
migration=6000
m12=0.001
M12=$( echo "4*$N*$m12" | bc -l ) #4Nm
dbneck_onset_t=$( echo "$dbneck_onset/(4*$N)" | bc -l ) #time in unit of 4N
dbneck_recover_t=$( echo "$dbneck_recover/(4*$N)" | bc -l ) #time in unit of 4N
divergence_t=$( echo "$divergence/(4*$N)" | bc -l ) #time in unit of 4N
migration_t=$( echo "$migration/(4*$N)" | bc -l ) #time in unit of 4N
#alpha=$( echo "-(1/$dbneck_recover_t)*l($dbneck_N/$N)" | bc -l ) # growth rate
replication=1

#one bottleneck
#ms $nSeq $replication -t $theta -r $theta $length -G $alpha -eG $dbneck_recover_t 0 -eN $dbneck_onset_t  1 > maizeBneck.ms

#######explanation of command######
#ms $nSeq $replication -t $theta -r $theta $length 
#-I 2 30 30  #two subpopulation each with 30 haploids
#-n 2 1 #set the initial population size of population 2 is equal to N
#-en $dbneck_recover_t 1 0.02 #set the population 1, the bottleneck start time
#-en $dbneck_onset_t 1 1 # set the population 1, the bottleneck recover time
#-em $migration_t 1 2 $M12 #at the migration_t migration from 2 to 1 
#-ej $divergence_t 2 1  #at divergence time, population 2 joined population 1

/work/LAS/mhufford-lab/lwang/bin/ms/msdir/ms $nSeq $replication -t $theta -r $theta $length -I 2 30 30 -n 2 1 -en $dbneck_recover_t 1 0.02 -en $dbneck_onset_t 1 1 -em $migration_t 1 2 $M12 -ej $divergence_t 2 1 