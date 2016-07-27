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
chr4.long <- gather(chr4.x2z, pop, introgression, ELP:XOC)
head(chr4.long)
ggplot(data=chr4.long, aes(x=gen, y=introgression, color=pop, group=pop)) + geom_line() + theme(legend.position=c(0.9, 0.8)) + xlab("genetic position")
ggsave("z2mIntro.pdf")


ggplot(data=chr4.long, aes(x=gen, y=introgression, color=pop, group=pop)) + geom_smooth(method="loess", size=1, formula = y ~ x, span=0.04) + theme(legend.position=c(0.9, 0.8)) + xlab("genetic position")
ggsave("z2mIntro.loessRegression.pdf")

