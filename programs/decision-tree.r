#install.packages("rpart")
#install.packages("rpart.plot")

library('rpart')
library('rpart.plot')

# Classification Tree with rpart
library(rpart)

input.dat = read.csv("data.csv",header=TRUE,sep = "\t")

input.dat

# grow tree 
fit <- rpart(BUYS_COMPUTER ~ AGE + INCOME + STUDENT + CREDIT_RATING, method = 'class',data = input.dat,control =rpart.control(minsplit = 1,minbucket=1, cp=0))

printcp(fit) # display the results 
summary(fit) # detailed summary of splits

# plot tree 
plot(fit, uniform=TRUE, main="Tree")
text(fit, use.n=TRUE, all=TRUE, cex=.8)
