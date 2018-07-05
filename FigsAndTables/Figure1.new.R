library(data.table)
library(cowplot)
library(dplyr)
library(tidyr)

df <- read.delim("HapMix_vectors.txt")
head(df)
chr4 <- subset(df, df$chr==4)
head(chr4)
names(chr4)
head(chr4)
bias <- read.delim("chr4_vec.txt")
head(bias)
chr4.2 <- merge(chr4, bias, by="pos")
head(chr4.2)
length(chr4.2$pos)
length(chr4$pos)
names(chr4.2)

chr4.x2z <- chr4.2 %>% select(1:13,23)
names(chr4.x2z)
names(chr4.x2z)[5:13] <- gsub("_x2z", "", names(chr4.x2z)[5:13])
names(chr4.x2z)
chr4.correct <- chr4.x2z[, 5:13] - chr4.x2z$intro
head(chr4.correct)
head(chr4.x2z)
chr4.new <- data.frame(cbind(chr4.x2z[, 1:4], chr4.correct))
head(chr4.new)

chr4.long <- gather(chr4.new, populations, introgression, ELP:XOC)
chr4.long["mexicana"] <- ifelse(chr4.long$introgression <0, 0, chr4.long$introgression)
chr4.long["maize"] <- max(chr4.long$mexicana)-chr4.long$mexicana

chr4.long2 <- gather(chr4.long, geneticSource, ratio, mexicana:maize)

p <- ggplot(data=chr4.long2, aes(x=pos/1000000, y=ratio, fill=geneticSource))  + 
theme(legend.position="none") + 
xlab("physical position (Mb)") +
ylab("average admixture proportion across individuals")+
scale_y_continuous(limits=c(0, 1.9), breaks=c(0.5,1.5)) +
#geom_rect(xmin=162.9, xmax=192.8, ymin=0, ymax=1.9, color="black", alpha=0.1)+ 
geom_bar(stat="identity", position = "stack", width=1)+
facet_grid(populations ~ .)+
geom_vline(xintercept=c(162.9, 192.8), linetype="dashed")+
scale_fill_manual(values=c("firebrick", "dodgerblue"))
p

ggsave("Figure1new.pdf")
