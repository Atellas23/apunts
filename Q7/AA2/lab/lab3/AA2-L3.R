####################################################################
# AA2 - GCED
# Lluís A. Belanche

# LAB 3: modeling the Promoter Gene data
# version of September 2021
####################################################################

set.seed(6046)

## In genetics, a promoter is a region of DNA that facilitates the transcription of a particular gene. 
## Promoters are located near the genes they regulate.

## Promoter Gene Data: data sample that contains DNA sequences, classified into 'promoters' and 'non-promoters'.
## 106 observations, 2 classes (+ and -)
## The 57 explanatory variables describing the DNA sequence have 4 possible values, represented 
## as the nucleotide at each position:
##    [A] adenine, [C] cytosine, [G] guanine, [T] thymine.

## The goal is to develop a predictive model (a classifier)

################################################
##### data reading

dd <- read.csv2("promotergene.csv")

p <- ncol(dd)
n <- nrow(dd)

summary(dd)

################################################
# Multiple correspondence analysis

source ("acm.r")

X <- dd[,2:p]

mc <- acm(X)

plot(mc$rs[,1],mc$rs[,2],type="n")
text(mc$rs[,1],mc$rs[,2],labels=row.names(mc$rs),col=as.numeric(dd$Class))
axis(side=1, pos= 0, labels = F, col="cyan")
axis(side=3, pos= 0, labels = F, col="cyan")
axis(side=2, pos= 0, labels = F, col="cyan")
axis(side=4, pos= 0, labels = F, col="cyan")

# Histogram of eigenvalues

barplot(mc$vaps)

# estimation of the number of dimensions to keep (out of the n-1 = 105)

i <- 1

while (mc$vaps[i] > mean(mc$vaps)) i <- i+1

(nd <- i-1)

################################################
# Logistic Regression

# First we create a "maximal" model (using all the predictors)

Psi <- as.data.frame(mc$rs[,1:nd])

attach(dd)

gl1 <- glm(Class~., data=Psi, family=binomial)

summary(gl1)

# it seems the apparent fit is very good, probably due to the large number of regressors

# selection of significant regressors using the AIC

step(gl1)

glf <-  glm(Class ~ V1 + V2 + V22 + V25 + V28 + V38, family = binomial, data = Psi)

summary(glf)

# quality estimation of the model (optimistic!)

glfpred=NULL
glfpred[glf$fitted.values<0.5]=0
glfpred[glf$fitted.values>=0.5]=1
table(dd[,1],glfpred)

# What would be a better way? adjust the model to a learning set and
# use it to predict a test set. Let's see:

# Create a new dataframe 'Psi2' for convenience

Psi2 <- as.data.frame(cbind(Psi,dd[,1]))
names(Psi2)[43] <- "Class"
attach(Psi2)

# split data into learn (2/3) and test (1/3) sets

set.seed(2)
index <- 1:n
learn <- sample(1:n, round(0.67*n))

# refit a new model in the learning (note: there is no need to use
# cross-validation on this set since we use the AIC)

Psi.train <- glm (Class~., data=Psi2[learn,], family=binomial)

# simplify (choose the optimal model)

step(Psi.train)

# note that the results are different ...

Psi.train <- glm (Class~V1 + V2 + V7 + V22 + V38, data=Psi2[learn,], family=binomial)

summary(Psi.train)

# compute new error in 'learn'

glfpred=NULL
glfpred[Psi.train$fitted.values>=0.5]=1
glfpred[Psi.train$fitted.values<0.5]=0

table(dd[learn,1],glfpred)

# again perfect (100%) ... let's see the test ...

Psi.test = predict(Psi.train, newdata=Psi2[-learn,]) 
pt = 1/(1+exp(-Psi.test))

glfpred=NULL
glfpred[Psi.test>=0.5]=1
glfpred[Psi.test<0.5]=0

(tt <- table(dd[-learn,1],glfpred))

# Well, this is more realistic ...

error_rate.test <- 100*(1-sum(diag(tt))/sum(tt))
error_rate.test

# gives a prediction error of 11.43%

################################################
##### Support vector machine

library(kernlab)

# Note we use LOOCV because the data set is very small; in other circumstances we could use 10CV, 5CV or even better 10x10CV or 10x5CV

# we start with a linear kernel

my.svm <- ksvm (Class~.,data=Psi2[learn,],kernel='polydot',C=1,cross=length(learn))

# note Number of Support Vectors, Training error and Cross validation error

my.svm

# then choose quadratic kernel

quad <- polydot(degree = 2, scale = 1, offset = 1)

my.svm <- ksvm (Class~.,data=Psi2[learn,],kernel=quad,C=1,cross=length(learn))

# note Number of Support Vectors, Training error and Cross validation error

my.svm

# choose now the RBF kernel with automatic adjustment of the variance (sigma?)

my.svm <- ksvm (Class~.,data=Psi2[learn,],C=1,cross=length(learn))

# note Number of Support Vectors, Training error and Cross validation error

my.svm

# idem but changing the cost parameter C

my.svm <- ksvm (Class~.,data=Psi2[learn,],C=5,cross=length(learn))

# note Number of Support Vectors, Training error and Cross validation error

my.svm

# we choose this latter model and use it to predict the test set

svmpred <- predict (my.svm, Psi2[-learn,-43])

tt <- table(dd[-learn,1],svmpred)

error_rate.test <- 100*(1-sum(diag(tt))/sum(tt))
error_rate.test

# gives a prediction error of 14.29%

## What if we use the reduced set of variables from LogReg?

(my.svm <- ksvm (Class~V1 + V2 + V7 + V22 + V38,data=Psi2[learn,],C=5,cross=length(learn)))

# It seems clear that we should use this latter model; then

svmpred <- predict (my.svm, Psi2[-learn,-43])

tt <- table(dd[-learn,1],svmpred)

error_rate.test <- 100*(1-sum(diag(tt))/sum(tt))
error_rate.test

# gives again a prediction error of 11.42%


################################################
## Linear discriminant analysis 

library(MASS)

my.lda <- lda (Class ~ ., prior = c(1,1)/2, data = Psi2[learn,], CV=TRUE)
tt <- table(Psi2[learn,43],my.lda$class)
error_rate.test <- 100*(1-sum(diag(tt))/sum(tt))
error_rate.test

# LOOCV error is 14.08%

my.lda <- lda (Class ~ ., prior = c(1,1)/2, data = Psi2[learn,], CV=FALSE)
pred <- predict(my.lda, Psi2[-learn,])$class
tt <- table(Psi2[-learn,43],pred)
error_rate.test <- 100*(1-sum(diag(tt))/sum(tt))
error_rate.test

# test error is 20%

################################################
## Quadratic discriminant analysis

# can not be used because there are insufficient data, but we can try
# to use it with fewer variables: we choose the logistic regression selection

my.qda <- qda (Class ~ V1 + V2 + V7 + V22 + V38, prior = c(1,1)/2, data = Psi2[learn,], CV=TRUE)
tt <- table(Psi2[learn,43],my.qda$class)
error_rate.test <- 100*(1-sum(diag(tt))/sum(tt))
error_rate.test

# LOOCV error is 2.8%

my.qda <- qda (Class ~ V1 + V2 + V7 + V22 + V38, prior = c(1,1)/2, data = Psi2[learn,], CV=FALSE)
pred <- predict(my.qda, Psi2[-learn,])$class
tt <- table(Psi2[-learn,43],pred)
error_rate.test <- 100*(1-sum(diag(tt))/sum(tt))
error_rate.test

# we obtain 8.6%, the best so far

# We have reduced the classification error from 50% to 8.6%
