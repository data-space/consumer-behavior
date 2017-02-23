summary(train)


#remove missing values from all the rovws
train <- na.omit(train)

#to remove missing/NA values 
train<- train[!is.na(train$Upc), ]
train <-train[!(train$Upc==""), ]

# to convert the continous variable into categorical variable
train$TripType = as.factor(train$TripType)
train$DepartmentDescription = as.factor(train$DepartmentDescription)

#plot frequency bar chart 
ggplot(data.frame(train), aes(x=train$TripType)) +
  geom_bar()

#frequency count of the triptype
count(train,'TripType')

#plot triptype frequncy bar chart
ggplot(data.frame(train), aes(x=train$TripType)) +
  geom_bar()

#plot department frequency bar chart
ggplot(data.frame(train), aes(x=train$DepartmentDescription)) + 
  geom_bar() +
  #to print the x-axis labels diagonally
  theme(axis.text.x=element_text(angle=45,vjust= 1,hjust=1))

#plot Triptype frequency chart
ggplot(data.frame(train), aes(x=train$TripType)) + 
  geom_bar() +
  #to print the x-axis labels diagonally
  theme(axis.text.x=element_text(angle=45,vjust= 1,hjust=1))

#plot of each Weekday vs count of trip type
ggplot(data.frame(train), aes(x =train$Weekday)) +
  geom_bar(aes(fill = train$TripType), position = "dodge", stat="count")

# not working - subsetting the data by Weekday = Friday and then plotting count of Triptype
ggplot(subset(train, train$Weekday == "Tuesday"), aes(x = TripType)) +
  geom_bar(stat = "count")


#plot of count of trip type with respect to days
ggplot2.barplot(data=train, xName="TripType",
                faceting=TRUE, facetingVarNames="Weekday", 
                facetingDirection="vertical") 

ggplot2.barplot(data=train, xName="DepartmentDescription",
                groupName="TripType") +
  theme(axis.text.x=element_text(angle=45,vjust= 1,hjust=1))



