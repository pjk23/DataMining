#includes the libraries
library(arules)

#finding association rules
txn = read.transactions(file="ItemList.csv", rm.duplicates= TRUE, format="basket",sep=",",cols=1)
txn@itemInfo$labels <- gsub("\"","",txn@itemInfo$labels)
basket_rules <- apriori(txn,parameter = list(sup = 0.01, conf = 0.5,target="rules"));

inspect(basket_rules)

itemFrequencyPlot(txn, topN = 5)