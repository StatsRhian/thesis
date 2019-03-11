####################################################################
####################################################################
# Create Dataset 1
####################################################################
####################################################################

a <- rnorm(1000, -3, .5)
b <- rnorm(1000, 5, .5)

c <- rnorm(1000, 3, .5)
d <- rnorm(1000, -3, .5)

e <- rnorm(1000, 0, .5)
f <- rnorm(1000, 0, .5)

g <- rnorm(1000, 2, .5)
h <- rnorm(1000, 3, .5)

i <- rnorm(1000, -2, .5)
j <- rnorm(1000, -2, .5)

data1 <- cbind(a, b, 1)
data2 <- cbind(c, d, 2)
data3 <- cbind(e, f, 3)
data4 <- cbind(g, h, 4)
data5 <- cbind(i, j, 5)

my_data1 <- as.data.frame(rbind(data1,data2,data3, data4,data5))
my_data1[,3] <- as.factor(my_data1[,3])
plot(my_data1[,1],my_data1[,2], col = my_data1[,3])

####################################################################
####################################################################
# Plot and Save Dataset 1
####################################################################
####################################################################

library("ggplot2")

p1 <- ggplot(my_data1, aes(a, b, colour = V3) ) +
  geom_point() +
  theme(legend.position="none", 
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()) +
  scale_colour_brewer(palette = "Set1")

ggsave(p1, file="E://Dropbox/Work/research/documents/thesis/Chapter3/figures/my_compact.png",
       width = 8, height = 8, units = "in", dpi = 300)

####################################################################
####################################################################
# Create Dataset 2
####################################################################
####################################################################

n     <- 5000                 # large enough for meaningful tests
z     <- 2*runif(n) - 1          # uniform on [-1, 1]
theta <- 2*pi*runif(n) - pi      # uniform on [-pi, pi]
x     <- sin(theta)*sqrt(1-z^2)  # based on angle
y     <- cos(theta)*sqrt(1-z^2)     
temp <- x^2+y^2

x1 <- x
y1 <- y
x1[which(temp<0.8)] <- NA
y1[which(temp<0.8)] <- NA
plot(x1,y1, col = 2)

x2 <- x
y2 <- y
x2[which(temp < 0.4 | temp > 0.6)] <- NA
y2[which(temp < 0.4 | temp > 0.6)]  <- NA
points(x2,y2, col = 3)

x3 <- x
y3 <- y
x3[which(temp < 0.07 | temp > 0.2)] <- NA
y3[which(temp < 0.07 | temp > 0.2)]  <- NA
points(x3,y3, col = 4)


data1 <- cbind(x1[!is.na(x1)], y1[!is.na(y1)], 1 )
data2 <- cbind(x2[!is.na(x2)], y2[!is.na(y2)], 2 )
data3 <- cbind(x3[!is.na(x3)], y3[!is.na(y3)], 3 )
my_data2 <- as.data.frame(rbind(data1,data2,data3))
my_data2[,3] <- as.factor(my_data2[,3])

####################################################################
####################################################################
# Plot and Save Dataset 2
####################################################################
####################################################################

library("ggplot2")

p2 <- ggplot(my_data2, aes(V1, V2, colour = V3) ) +
     geom_point() +
     theme(legend.position="none", 
          axis.title.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank())
ggsave(p2, file="E://Dropbox/Work/research/documents/thesis/Chapter3/figures/my_connected.png",
       width = 8, height = 8, units = "in", dpi = 300)

  


