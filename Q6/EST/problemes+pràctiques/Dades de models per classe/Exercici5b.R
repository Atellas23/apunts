library(car)

Col = read.csv2("col.csv")
head(Col)

plot(Col$P,Col$C)
plot(Col$E,Col$C)
plot(Col$H,Col$C)


# Pregunta a)

modelP = lm(C~P, data=Col, x=T)
summary(modelP)

help(summary.lm)

scatterplot(C~P,smooth=F,box=F,Col)
abline(h=mean(Col$C), lty=2)



# Pregunta b)

library(HH)
ci.plot(modelP)
# Nomes funciona per una sola variable explicativa



# Pregunta c) 

# Validar linealitat, varianca constant i existencia valors estranys
plot(predict(modelP),resid(modelP))
abline(h=0,lty=2)
plot(predict(modelP),rstandard(modelP))
abline(h=c(-2,0,2),lty=2)
plot(predict(modelP),rstudent(modelP))
abline(h=c(-2,0,2),lty=2)

# Validar normalitat
qqnorm(rstandard(modelP))

# Tambe ajuden a detectar valors estranys
plot(rstandard(modelP))
abline(h=c(-2,0,2),lty=2)
plot(rstudent(modelP))
abline(h=c(-2,0,2),lty=2)

# Influencia
plot(cooks.distance(modelP))
#plot(hatvalues(modelP))
#influencePlot(modelP)


# Pregunta d)

pairs(~C+P+H+E,Col)

modelPHE = lm(C~P+H+E, data=Col, x=T)
summary(modelPHE)

scatterplot(C ~ P|E, smooth=F, box = F, col=1:12, data = Col)
