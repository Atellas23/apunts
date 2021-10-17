####################################################################
# AA2 - GCED
# Lluís A. Belanche

# LAB 2: modelling 2D classification data
# version of September 2021
####################################################################

## the SVM is located in two different packages: one of them is 'e1071'
library(e1071)

## First we create a simple two-class data set:

N <- 200

make.sinusoidals <- function(m,noise=0.2) 
{
  x1 <- c(1:2*m)
  x2 <- c(1:2*m)
  
  for (i in 1:m) {
    x1[i] <- (i/m) * pi
    x2[i] <- sin(x1[i]) + rnorm(1,0,noise)
  }
  
  for (j in 1:m) {
    x1[m+j] <- (j/m + 1/2) * pi
    x2[m+j] <- cos(x1[m+j]) + rnorm(1,0,noise)
  }
  
  target <- c(rep(+1,m),rep(-1,m))
  
  return(data.frame(x1,x2,target))
}

## let's generate the data
dataset <- make.sinusoidals (N)

## and have a look at it
summary(dataset)

plot(dataset$x1,dataset$x2,col=as.factor(dataset$target))

## Now we define a utility function for performing k-fold CV
## the learning data is split into k equal sized parts
## every time, one part goes for validation and k-1 go for building the model (training)
## the final error is the mean prediction error in the validation parts
## Note k=N corresponds to LOOCV

## a typical choice is k=10
k <- 10 
folds <- sample(rep(1:k, length=N), N, replace=FALSE) 

valid.error <- rep(0,k)

C <- 1

## This function is not intended to be useful for general training purposes but it is useful for illustration
## In particular, it does not optimize the value of C (it requires it as parameter)

train.svm.kCV <- function (which.kernel, mycost)
{
  for (i in 1:k) 
  {  
    train <- dataset[folds!=i,] # for building the model (training)
    valid <- dataset[folds==i,] # for prediction (validation)
    
    x_train <- train[,1:2]
    t_train <- train[,3]
    
    switch(which.kernel,
           linear={model <- svm(x_train, t_train, type="C-classification", cost=mycost, kernel="linear", scale = FALSE)},
           poly.2={model <- svm(x_train, t_train, type="C-classification", cost=mycost, kernel="polynomial", degree=2, coef0=1, scale = FALSE)},
           poly.3={model <- svm(x_train, t_train, type="C-classification", cost=mycost, kernel="polynomial", degree=3, coef0=1, scale = FALSE)},
           RBF={model <- svm(x_train, t_train, type="C-classification", cost=mycost, kernel="radial", scale = FALSE)},
           stop("Enter one of 'linear', 'poly.2', 'poly.3', 'radial'"))
    
    x_valid <- valid[,1:2]
    pred <- predict(model,x_valid)
    t_true <- valid[,3]
    
    # compute validation error for part 'i'
    valid.error[i] <- sum(pred != t_true)/length(t_true)
  }
  # return average validation error
  sum(valid.error)/length(valid.error)
}

# Fit an SVM with linear kernel

(VA.error.linear <- train.svm.kCV ("linear", C))

## We should choose the model with the lowest CV error and refit it to the whole learning data
## then use it to predict the test set; we will do this at the end

## As for now we wish to visualize the models

# so first we refit the model:

model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="linear", scale = FALSE)

## Now we are going to visualize what we have done; since we have artificial data, instead of creating
## a random test set, we can create a grid of points as test

plot.prediction <- function (model.name, resol=200)
  # the grid has a (resol x resol) resolution
{
  x <- cbind(dataset$x1,dataset$x2)
  rng <- apply(x,2,range);
  tx <- seq(rng[1,1],rng[2,1],length=resol);
  ty <- seq(rng[1,2],rng[2,2],length=resol);
  pnts <- matrix(nrow=length(tx)*length(ty),ncol=2);
  k <- 1
  for(j in 1:length(ty))
  {
    for(i in 1:length(tx))
    {
      pnts[k,] <- c(tx[i],ty[j])
      k <- k+1
    } 
  }
  
  # we calculate the predictions on the grid
  
  pred <- predict(model, pnts, decision.values = TRUE)
  
  z <- matrix(attr(pred,"decision.values"),nrow=length(tx),ncol=length(ty))
  
  # and plot them
  
  image(tx,ty,z,xlab=model.name,ylab="",axes=FALSE,
        xlim=c(rng[1,1],rng[2,1]),ylim=c(rng[1,2],rng[2,2]),
        col = cm.colors(64))
  #        col = rainbow(200, start=0.9, end=0.1))
  
  # then we draw the optimal separation and its margins
  
  contour(tx,ty,z,add=TRUE, drawlabels=TRUE, level=0, lwd=3)
  contour(tx,ty,z,add=TRUE, drawlabels=TRUE, level=1, lty=1, lwd=1, col="grey")
  contour(tx,ty,z,add=TRUE, drawlabels=TRUE, level=-1, lty=1, lwd=1, col="grey")
  
  # then we plot the input data from the two classes
  
  points(dataset[dataset$target==1,1:2],pch=21,col=1,cex=1)
  points(dataset[dataset$target==-1,1:2],pch=19,col=4,cex=1)
  
  # finally we add the SVs
  
  sv <- dataset[c(model$index),];
  sv1 <- sv[sv$target==1,];
  sv2 <- sv[sv$target==-1,];
  points(sv1[,1:2],pch=13,col=1,cex=2)
  points(sv2[,1:2],pch=13,col=4,cex=2)
}

## plot the predictions, the separation, the support vectors, everything
plot.prediction ("linear")

## right, now a quadratic SVM model 

(VA.error.poly.2 <- train.svm.kCV ("poly.2", C))

model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="polynomial", degree=2, coef0=1, scale = FALSE)
plot.prediction ("poly.2")

## right, now a cubic SVM model 

(VA.error.poly.3 <- train.svm.kCV ("poly.3", C))

model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="polynomial", degree=3, coef0=1, scale = FALSE)
plot.prediction ("poly.3")

## and finally an RBF Gaussian SVM model 

(VA.error.RBF <- train.svm.kCV ("RBF", C))

model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="radial", scale = FALSE)
plot.prediction ("RBF")

## Now in a real scenario we should choose the model with the lowest CV error
## which in this case is the RBF

## In a real setting we should optimize the value of C, again with CV; this can be done
## very conveniently using tune() in this package to do automatic grid-search

## another, more general, possibility is to use the train() method in the {caret} package

## Just for illustration, let's see the effect of altering C (significantly):
C <- 50

(VA.error.linear <- train.svm.kCV ("linear", C))
model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="linear", scale = FALSE)
plot.prediction ("linear")

(VA.error.RBF <- train.svm.kCV ("RBF", C))
model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="radial", scale = FALSE)
plot.prediction ("RBF")

C <- 0.05

(VA.error.linear <- train.svm.kCV ("linear", C))
model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="linear", scale = FALSE)
plot.prediction ("linear")

(VA.error.RBF <- train.svm.kCV ("RBF", C))
model <- svm(dataset[,1:2],dataset[,3], type="C-classification", cost=C, kernel="radial", scale = FALSE)
plot.prediction ("RBF")
