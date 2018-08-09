options(scipen=999)
df <- read.table("pop12.sim.2dsfs")
head(df)
sfs <- as.numeric(df[1, ])
sfs <- matrix(sfs, nrow=31, ncol=31, byrow=T)
sfs
out <- matrix(NA, nrow=33, ncol=32)
out[1,1] <- "1 observations"
out[2, 2:32] <- paste("maize_", 0:30, sep="")
out[3:33, 1] <- paste("teo_", 0:30, sep="")
out[3:33, 2:32] <- sfs
head(out)
write.table(out, file="pop12.2dsfs.FSC", quote=F, sep="\t",row.names=F,col.names=F,na="")
savehistory("angsd2dsfs_to_FSC2dsfs.R")
