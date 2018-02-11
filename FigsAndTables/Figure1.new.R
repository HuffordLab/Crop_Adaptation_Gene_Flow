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

p <- ggplot(data=chr4.long, aes(x=pos/1000000, y=introgression, color=populations, group=populations)) + geom_smooth(method="loess", size=1, se=F, formula = y ~ x, span=0.05) + theme(legend.position=c(0.9, 0.8)) + xlab("physical position (mb)") +
ylab("introgression level from mexicana to maize")+
scale_y_continuous(limits=c(0, 1.8)) +
geom_rect(xmin=162.9, xmax=192.8, ymin=0, ymax=0.03, color="black", fill="black")
p
ggsave("Figure1new.pdf")
