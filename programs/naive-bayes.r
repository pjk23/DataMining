library(e1071)
library(rjson)
#Load Data
input.dat <- fromJSON(file = "credit-g.json")
#Print data
View(input.dat)
#Train the Model
model <- naiveBayes(BUYS_COMPUTER ~ AGE + INCOME + STUDENT + CREDIT_RATING, data = input.dat)
#Predict using that model
input.dat[1,]
predict(model, input.dat[1,-5])
