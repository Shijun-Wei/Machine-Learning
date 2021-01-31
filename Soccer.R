# Title     : TODO
# Objective : TODO
# Created by: shijunwei
# Created on: 1/27/21



setwd("~/UCD Drive/452 Machine Learning/Assignment 3")
library(ggplot2)
library(tidyr)
library(Hmisc)
library(dplyr)
library(reshape2)
library(caret)
library(ggpubr)
library(moments)
library(corrplot)
library(repr)
library(glmnet)


soccer <- read.csv('FIFA_Player_List.csv')
soccer<- soccer[,2:16] ## get rid of name
## create dummies for preferred foot with 1 = left ,0 = right
soccer$Preferred.Foot<- ifelse(soccer$Preferred.Foot == 'Left', 1, 0)  
str(soccer)
## check null value
colSums(is.na(soccer))  ## no null values

y <- assoccer$Market.Value 
hist(y)  ## right skewed
y<- log(soccer$Market.Value)
hist(y)   ## close to normal 
skewness(y, na.rm = TRUE)  ## check skewness

x <- soccer[,-3]
## vis
par(mar=c(1,1,1,1))
hist.data.frame(soccer)

cor<- cor(soccer)

corrplot(cor,method = "color", addCoef.col="black", order = "AOE",number.cex= 7/ncol(soccer),tl.col="black",tl.cex=0.5)


## Data Analysis (20 pts) - Analyze, summarize and visualize the data and the
## interaction between different variables and features.

# corrolation of all the variables

cor<- rcorr(as.matrix(soccer))

# Extract the correlation coefficients

# Extract p-values
pval<- cor$P



# Feature Selection

# stepwise regression


# Model Selection (40 pts) - For this assignment, we are focusing on Regularization techniques. Compare the L1 and L2 Norm regularization techniques (Lasso and Ridge, respectively), different penalty terms, and model transformations to build and visualize the optimal model. (Use Cross Validation to select the optimal tuning parameters and compare it with the AIC model selection)
library(glmnet)

full<- lm(log(soccer$Market.Value) ~., data= soccer)
summary(full)
car::vif(full)

reduced<- soccer[,1:2]

# Model Evaluation (20 pts) - Divide the data into test and train and evaluate the model along with fit, residuals, and standard error plots.
set.seed(1)
trainIndex <- createDataPartition(soccer$Market.Value, p =0.9,
                                  list = FALSE,
                                  times = 1)
Train <- soccer[ trainIndex,]
Valid <- soccer[-trainIndex,]

# Conclusion (Optional, 5 Bonus pts) - Summarize your thought process and discuss future steps and model improvements.