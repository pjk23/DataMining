library(plyr)
library(dplyr)
if(sessionInfo()['basePkgs']=="dplyr" | sessionInfo()['otherPkgs']=="dplyr"){
  detach(package:dplyr, unload=TRUE)
}

#read the data
df_groceries <- read.csv('groceries.csv')

#pre process the data
df_sorted <- df_groceries[order(df_groceries$Member_number),]  #sort based on id_number
df_sorted$Member_number <- as.numeric(df_sorted$Member_number) #convert to numeric data

#to clean the data we use ddply function
#we keep the data in basket (tuples) format
df_itemList <- ddply(df_groceries,c("Member_number","Date"), function(df1)paste(df1$itemDescription, collapse = ","))
#columns no longer needed
df_itemList$Member_number <- NULL
df_itemList$Date <- NULL

#Rename column header as item list
colnames(df_itemList) <- c("itemList")
write.csv(df_itemList,"ItemList.csv", row.names = TRUE)