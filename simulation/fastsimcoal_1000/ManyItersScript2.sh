#!/bin/bash

#run with: nohup ./ManyItersScript.sh &> output.txt &


mkdir ManyItersResults2

for i in {1..1000}
do
 echo $i;   
 mkdir ManyItersResults2/result.$i;
 cp NPlantsModel_jointMAFpop1_0.obs ManyItersResults2/result.$i;
 cp NPlantsModel.est ManyItersResults2/result.$i;
 cp NPlantsModel.tpl ManyItersResults2/result.$i;
# cd ManyItersResults/result.$i;
# /work/LAS/mhufford-lab/lwang/bin/fsc_linux64-2/fsc25 -t NPlantsModel.tpl -n 100000 -N 100000 -d -e NPlantsModel.est -M 0.001 -l 10 -L 39 -q ;
# cd ../.. ;
done

# Find ML Parameters
#ML=$(tail -n 1 ManyItersResults/result.1/Instant/Instant.bestlhoods | cut -f 7)

#for i in {2..100}
#do
#  TMP=$(tail -n 1 ManyItersResults/result.$i/Instant/Instant.bestlhoods | cut -f 7)
#  comp=$(echo "$ML < $TMP" | bc)
#  if [ $comp = '1' ];
#  then
#      echo $i "is current ML";
#      ML=$TMP
#  else
#      echo $i "is not current ML"
#  fi
#done
