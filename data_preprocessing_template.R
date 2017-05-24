# Importing the dataset
dataset = read.csv('Data.csv')

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
# training_set[, 2:3] = scale(training_set[, 2:3])
# testing_set[, 2:3] = scale(testing_set[, 2:3])

