//Parameters for the coalescence simulation program : fsimcoal2.exe
2 samples to simulate :
//Population effective sizes (number of genes)
N_MAIZE
N_TEO
//Samples sizes and samples age 
23
13
//Growth rates	: negative growth implies population expansion
MGROW
0
//Number of migration matrices : 0 implies no migration between demes
2
//Migration matrix 0
0	MigMT
MigTM	0
//Migration matrix 1
0 0
0 0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
2 historical event
TSHRINK 0 0 0 N_Bot 0 1
TSPLIT  0 1 1 1 0 1
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 0 3e-8 OUTEXP

