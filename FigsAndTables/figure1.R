library(data.table)
library(cowplot)
library(dplyr)
library(tidyr)
df <- read.delim("HapMix_vectors.txt")
head(df)
chr4 <- subset(df, df$chr==4)
head(chr4)
names(chr4)

chr4.x2z <- chr4 %>% select(1:13)
names(chr4.x2z)
names(chr4.x2z)[5:13] <- gsub("_x2z", "", names(chr4.x2z)[5:13])
names(chr4.x2z)
chr4.long <- gather(chr4.x2z, populations, introgression, ELP:XOC)
head(chr4.long)
#ggplot(data=chr4.long, aes(x=gen, y=introgression, color=populations, group=populations)) + geom_line() + theme(legend.position=c(0.9, 0.8)) + xlab("genetic position")
#ggsave("z2mIntro.pdf")

seg <- data.frame(x1 = 162.885280, x2 = 192.761788, y1 = 2, y2 = 2)


p <- ggplot(data=chr4.long, aes(x=pos/1000000, y=introgression, color=populations, group=populations)) + geom_smooth(method="loess", size=1, formula = y ~ x, span=0.01) + theme(legend.position=c(0.9, 0.8)) + xlab("physical position (mb)") +
ylab("introgression level from mexicana to maize")+
scale_y_continuous(limits=c(0, 2))
p + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = seg, size=2)+
scale_y_continous(limits=c(0, 2))

ggsave("Figure1.pdf")

seg <- data.frame(x1 = 325.8, x2 = 397.4, y1 = 0, y2 = 0.05)

ggplot(data=chr4.long, aes(x=gen, y=introgression, color=populations, group=populations)) + geom_smooth(method="loess", size=1, formula = y ~ x, span=0.04) + theme(legend.position=c(0.9, 0.8)) + xlab("genetic position (cM)") +
ylab("introgression level from mexicana to maize") +
geom_rect(xmin=325.8, xmax=397.4, ymin=0, ymax=0.05, color="black") 

ggsave("Figure1.pdf")

325.8	397.4
geom_rect(xmin=325.8, xmax=397.4, ymin=0, ymax=0.05), color="black") 
