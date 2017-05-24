# Importing the dataset
dataset = read.csv('Data.csv')

# Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age), 
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), 
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

# Encoding categorical data
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))

# Splitting the datast into the Training set and Test set
# Uncmmant the line below, if you havent installed caTools
#install.packages('caTools')

# enable library
library(caTools)

set.seed(123)
# true means go to the train set
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

# feature scaling
# it needs to be numerical, however factor is not numerical, dont include them
training_set[, 2:3] = scale(training_set[, 2:3])
testing_set[, 2:3] = scale(testing_set[, 2:3])










