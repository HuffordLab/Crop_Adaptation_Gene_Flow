df <- read.delim("result.txt")
head(df)
library(cowplot)
ggplot(data=df, aes(x=N_BOT)) + geom_bar(stat="bin", bins=100) + geom_vline(xintercept=10000, color="red") + xlab("Ne at bottleneck") + scale_x_continuous(limits=c(9000, 100000), breaks=c(10000, 100000)) + ggtitle("p < 0.01")
ggsave("NbotEstimation.pdf")
ggplot(data=df, aes(x=TRECOVER)) + geom_bar(stat="bin", bins=100) + geom_vline(xintercept=10000, color="red") + xlab("onset timing of bottleneck") + scale_x_continuous(limits=c(3800, 12000), breaks=c(7000, 10000)) + ggtitle("p=0.005")
ggsave("botTimingEstimation.pdf")

savehistory("PlotResult.R")
