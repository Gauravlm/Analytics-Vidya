##############################################################
#   missing values treatments
#############################################################

# check missing values in complete data set
table(is.na(train))
# check missing values column vise
colSums(is.na(train))

library(mlr)
# 2--------------> Imputation
#impute missing values with mode
imputed_data <- impute(train,classes = list(factor = imputeMode()))
#update train data set with imputed values
train<- imputed_data$data
# now check missing values again
colSums(is.na(train))

imputed_test_data <- impute(test,classes = list(factor = imputeMode()))
test<- imputed_test_data$data
colSums(is.na(test))




#################################################################################
#         Outlier treatment
################################################################################

#making scatter plot for age
library(ggplot2)

#create scatter plot
ggplot(train,aes(ID,Age)) + geom_jitter()

# making scatter plot for Hours-per-week
ggplot(train,aes(ID,Hours.Per.Week)) + geom_jitter()
