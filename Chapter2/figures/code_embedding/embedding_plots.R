rm(list = ls())
library(rARPACK)
library(ggplot2)


x <- read.table(file = "spiral.txt")
data <- x[,1:2]
true <- x[,3]

source("SpectralClustering.R")
out <- SpecClust(X = data, Laplacian = 'sym',k = 3,  graphtype = 'kernel', params = list(sigma = 1))
#image(out$affinity)

original <- ggplot(x, aes(x = V1, y = V2, col = as.factor(V3))) + 
  geom_point() +
  theme(legend.position="none",
axis.title.x=element_blank(),
axis.text.x=element_blank(),
axis.ticks.x=element_blank(),
axis.title.y=element_blank(),
axis.text.y=element_blank(),
axis.ticks.y=element_blank())

vectors <- as.data.frame(cbind(out$vectors, true))
names(vectors) = c("e1", "e2", "e3", "true")
      
embedded <- ggplot(vectors, aes(x = e1, y = e2, col = as.factor(true))) + 
  geom_point() +
  theme(legend.position="none",
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())

ggsave(original, filename = "3_spiral_original.png")
ggsave(embedded, filename = "3_spiral_embedded.png")


