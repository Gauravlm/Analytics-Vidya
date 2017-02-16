####################################################################
#       Univariate Variable
###################################################################

# load data
train<- read.csv('train_data.csv')
test<- read.csv('test_data.csv')

# check data type of each column
str(train)

# 1------>Continuous variable
# lets group continuous and categoriacal for this activity
train_count <- subset(train, select= c(ID,Age,Hours.Per.Week))
# -c()  means remeaning columns other than bracket column
train_cat <- subset(test, select= -c(ID,Age,Hours.Per.Week))    

summary(train_count)

# install package
install.packages("pastecs")
library(pastecs)
# set significant digits and get detailed summary
options(scipen =100)
options(digits = 2)
stat.desc(train_count)

# 2-----------> Categorical Variables:
apply(train_cat,2,function(x){length(unique(x))})
# 2.2 -------> Analysing Race
# print the count of each category
table(train_cat$Race)
# print percentage of observation in each category
as.matrix(prop.table(table(train_cat$Race)))


# 2.2 ------------> Analyzing Native country
# print counts of top 20 country
head(sort(table(train_cat$Native.Country),decreasing = TRUE),20)

# print the percentage of observation of top 20 countries
head(round(sort(prop.table(table(train_cat$Native.Country)),decreasing=TRUE),6),20 )
# here US itself count 90% of observation and mexico has 1% of observation apart from US.
# This infers that united states will largely influence the output values


##############################################################################################
#         Multivariate Analysis
##############################################################################################

library(gmodels)
# using crossTable from gmodels
CrossTable(train$Sex,train$Income.Group)
# from above table
# Out of total Females, 89.1% females have income <= 50K and only ~ 11% females have income >50K
# Out of total people which have income >50K, only 15% are females and 85% are males

library(ggplot2)
ggplot(train,aes(Sex,fill = Income.Group)) + 
       geom_bar() + 
       labs(title = "Sketch bar chart", x = "Sex",y ="Count")+
       theme_bw()

# categorical continuous combination
# create box plot
ggplot(train, aes(Sex, Hours.Per.Week))+
       geom_boxplot() +
       labs(title = "Boxplot")
# From above box plot
# 1.The median of male and female working hours are same
# 2.For Males, the first quarter and median values are same
# 3.For females, the median and third quarter are same.
# 4.Males have higher working hours in general because the 75% percentile of female corressponds to 25% percentile of males

