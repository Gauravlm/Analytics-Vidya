#############################################################################
#                 variable Transformation
#############################################################################

#check class of all variable
str(train)
sapply(train,class)


#determine % of objects in each category
as.matrix(prop.table(table(train$Workclass)) )

#Depending on the business scenario, we can combine the categories with very few observations. 
#As a thumbrule, lets combine categories with less than 5% of the values.

# using recode function package from car
library(car)
#combining factor levels with  few observation in  a new named others
train$Workclass <- recode(train$Workclass, "c('State-gov','Self-emp-inc','Federal-gov','Without-pay','Never-worked')='Others'")
test$Workclass <- recode(test$Workclass, "c('State-gov','Self-emp-inc','Federal-gov','Without-pay','Never-worked')='Others'")

#check factor level % now
as.matrix(prop.table(table(train$Workclass)))

#Here we can see that the categories have been successfully combined. Note that combining is not the best possible techniqe for solving the problem of high cardinality, 
#i.e. high number of unique values.
