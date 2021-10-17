####################################################################
# AA2 - GCED
# Lluís A. Belanche

# LAB 4: illustrating the SVM for regression and Outlier Detection
# version of September 2021
####################################################################

set.seed(6046)

## A really nice-looking function: 
doppler <- function (x) { sqrt(x*(1-x))*sin(2.1*pi/(x+0.05)) }

N <- 1000

x <- seq(0.2,1,length.out=N)
y <- doppler(x) + rnorm(N,sd=0.1)

# the truth ...

plot(x,xlim=c(0.15,1.0),ylim=c(-0.7,0.7),type="n")
curve (doppler(x), 0.2, 1, add=TRUE, col='magenta')

# the data ...

plot(x,y)

## With this choice of the 'epsilon' and 'gamma' parameters, the SVM underfits the data (blue line) 

model1 <- ksvm (x,y, epsilon=1.5, type="eps-svr")
lines(x,predict(model1,x),col="blue")

## With this choice of the 'epsilon' and 'gamma' parameters, the SVM overfits the data (green line)

model2 <- ksvm (x,y, epsilon=0.001, kpar=list(sigma=100), C=100, type="eps-svr")
lines(x,predict(model2,x),col="green")

## With this choice of the 'epsilon' and 'gamma' parameters, the SVM has a very decent fit (red line)
model3 <- ksvm (x,y, epsilon=0.01, kpar=list(sigma=10), type="eps-svr")
lines(x,predict(model3,x),col="red")

## With this choice of the 'epsilon' and 'gamma' parameters, the SVM has a very decent fit (red line)
model3 <- ksvm (x,y, epsilon=0.01, kpar = "automatic", type="eps-svr")
lines(x,predict(model3,x),col="orange")

## Now we switch to the {e1071} package
library(e1071)

## just a variation of the built-in example ...

N <- 1000

X <- data.frame(a = rnorm(N), b = rnorm(N))
attach(X)

# default nu = 0.5, to see how it works
(m <- svm(X, gamma = 0.1))

newdata <- data.frame(a = c(0, 2.5,-2,-2), b = c(0, 2.5,2,0))

# visualize:
plot(X, col = 1:N %in% m$index + 1, xlim = c(-5,5), ylim=c(-5,5))
text(newdata[,1],newdata[,2],labels=row.names(newdata),pch = "?", col = 3, cex = 2)

# Let's assume TRUE means "it is an outlier!"
# test:
!predict (m, newdata)

# now redo with nu = 0.01 (more in accordance with outlier detection)

(m <- svm(X, gamma = 0.1, nu = 0.01))

# visualize:
plot(X, col = 1:N %in% m$index + 1, xlim = c(-5,5), ylim=c(-5,5))
text(newdata[,1],newdata[,2],labels=row.names(newdata),pch = "?", col = 3, cex = 2)

# test:
!predict (m, newdata)
