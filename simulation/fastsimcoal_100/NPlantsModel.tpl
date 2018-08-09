//Parameters for the coalescence simulation program : fsimcoal2.exe
2 samples to simulate :
//Population effective sizes (number of genes)
500000
500000
//Samples sizes and samples age 
30
30
//Growth rates	: negative growth implies population expansion
0
0
//Number of migration matrices : 0 implies no migration between demes
0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
3 historical event
TSHRINK 0 0 0 RESIZE_BOT 0 0
TRECOVER 0 0 0 1 0 0
TSPLIT  0 1 1 1 0 0
//Number of independent loci [chromosome] 
10 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 3e-8 3e-8 OUTEXP

