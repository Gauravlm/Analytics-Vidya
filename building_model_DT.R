###################################################################
#       Predictive model
##################################################################

# This is classifiaction problem so here we are going to use Decision Tree algoritham

# step -1   ----> Data processing 

table(train$Income.Group)
# so we need to encode our department variable
train$Income.Group <- ifelse(train$Income.Group == "<=50K",0,1)
table(train$Income.Group)

# removing identifier variable of the data
train<- subset(train, select = -c(ID))

# for Decision Tree using rpart library
library(rpart)

# building the model
set.seed(333)
train_tree<- rpart(Income.Group~., data= train,method = "class",
                   control= rpart.control(minsplit =20,
                                          minbucket = 100,
                                          maxdepth = 10,
                                          xval = 5))

# minsplit : refer to minimum number of observation which must exit in a node to split
# minbucket: refer to minimum number of observation which must exit in terminal mode (leaf)
# maxdepth: refer to depth of the tree
# xval:     refer to cross validation

summary(train_tree)

# lets plot train_tree
library(rpart.plot)
rpart.plot(train_tree)
