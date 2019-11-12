setwd('../practicapie2')

y <- read.csv(file="input1.csv", header=TRUE, sep=";")
y <- as.numeric(sub(",", ".", unlist(y), fixed = TRUE))

alfa <- 18.7

# a)

beta <- 18
gamma_y <- dgamma(y, alfa, beta)

L = prod(gamma_y)
l = log(L)

# first answer
L
l

beta = 19
gamma_y <- dgamma(y, alfa, beta)

L = prod(gamma_y)
l = log(L)

# second answer
L
l

# b)

library(MASS)
beta_estimator = fitdistr(y, "gamma", start=list(shape=alfa, rate=beta), lower = c(alfa-0.0000000001, 0), upper = c(alfa, 100))$estimate

beta_estimator

gamma_y_estimator <- dgamma(y, alfa, beta_estimator)
L_estimator = prod(gamma_y_estimator)

L_estimator

log_likelihood <- function(beta_est) {
  temp_dist <- dgamma(y,alfa,beta_est)
  log_dist = log(temp_dist)
  sum_log_dist <- sum(log_dist)
}

library(numDeriv)

h <- hessian(log_likelihood,beta_estimator[2])
h

# c)
# suppose beta is following a normal distribution
# then we can find a 95% confidence interval as
c("inf"=qnorm(0.025,mean=beta_estimator[2],sd=sqrt(-1/h)),"sup"=qnorm(0.975,mean=beta_estimator[2],sd=sqrt(-1/h)))
beta_estimator[2]

# d)
# the test is H_0: beta = 18 vs. H_1: beta != 18
# we have to calculate the contrast statistic


