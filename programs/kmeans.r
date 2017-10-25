#load the required packages
#ggplot is used to create plots
library(ggplot2)

#plot the iris data set
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

#clustering
set.seed(20)
#forming a kmeans cluster
irisCluster <- kmeans(iris[,3:4], 3, nstart=20)
irisCluster

#plot to see the clusters
irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()