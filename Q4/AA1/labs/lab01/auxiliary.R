library(class) # knn

knn.imputation = function (variable, varname)
{  
  aux = subset (Credit, select = names(Credit)[names(Credit) != varname])
  aux1 = aux[!is.na(variable),]
  aux2 = aux[is.na(variable),]

  # Neither of aux1, aux2 can contain NAs
  knn.inc = knn (aux1,aux2, variable[!is.na(variable)])
  variable[is.na(variable)] = as.numeric(as.character(knn.inc))
  variable
} 

hist.with.normal = function (x, main, xlabel=deparse(substitute(x)), ...)
{
  h = hist(x,plot=F, ...)
  s = sd(x)
  m = mean(x)
  ylim = range(0,h$density,dnorm(0,sd=s))
  hist(x,freq=FALSE,ylim=ylim,xlab=xlabel, main=main, ...)
  curve(dnorm(x,m,s),add=T,col="red")
}

mosthighlycorrelated = function(mydataframe,numtoreport)
{
  # find the correlations
  cormatrix = cor(mydataframe)
  # set the correlations on the diagonal or lower triangle to zero,
  # so they will not be reported as the highest ones:
  diag(cormatrix) = 0
  cormatrix[lower.tri(cormatrix)] = 0
  # flatten the matrix into a dataframe for easy sorting
  fm = as.data.frame(as.table(cormatrix))
  # assign human-friendly names
  names(fm) = c("First.Variable", "Second.Variable","Correlation")
  # sort and print the top n correlations
  head(fm[order(abs(fm$Correlation),decreasing=TRUE),],n=numtoreport)
}
