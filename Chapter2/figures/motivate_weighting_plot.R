library(MASS)
library(ggplot2)
Sigma <- matrix(c(0.04,0.01,0.01,0.01),2,2)
x <- mvrnorm(n = 10000, rep(11, 2), Sigma)

Sigma2 <- matrix(c(5,3,3,10),2,2)
y <- mvrnorm(n = 1000, rep(20, 2), Sigma2)

z <- rbind(x,y)
df <- as.data.frame(z)

p <- ggplot(df, aes(V1, V2))
#p + geom_point(size=5, color="grey") + labs(title="Initial configuration")

init_centers <- rbind(y[sample(37),], x[sample(3),])
k <- kmeans(z,centers = init_centers)#, iter.max = 3)
centers <- as.data.frame(k$centers)

p <- p + geom_point(size=3, color="darkgrey") + 
  geom_point(data=centers, aes(V1, V2), size=15, color="blue", shape="+") +
  xlab("")+
  ylab("") 

#p
ggsave(p, filename = "motivate_weighting.png")
