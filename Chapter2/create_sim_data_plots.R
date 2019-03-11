#Plot my datasets
rm(list = ls())
invisible(sapply(X = list.files(path = "code/functions", pattern = "*.R$", full.names = TRUE, ignore.case = TRUE), source, .GlobalEnv))
dataset <- "hyperSphere"#"jumpNormal"#"staticNormal" #"hyperSphere"



source("code/generate_simulated_train.R")
data <- as.data.frame(cbind(data, trueClusters))
data[,ncol(data)] <- as.factor(data[,ncol(data)])

data <- data[1800:2000,] 
library("ggplot2")

p1 <- ggplot(data, aes(V1, V2, colour = trueClusters) ) +
  geom_point() +
  xlim(-1, 1) +
  ylim(-1, 1) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        legend.position="none", 
        axis.ticks.y = element_blank()) +
  scale_colour_brewer(palette = "Set1")

ggsave(p1, filename = "E:/Dropbox/Work/research/documents/thesis/Chapter3/figures/hyperSphere1800_2000.png", 
       width = 8, height = 8, units = "in", dpi = 300)
