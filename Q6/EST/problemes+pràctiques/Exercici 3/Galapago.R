
library(car)

Gal = read.csv2("Galapago0.csv")
head(Gal)
Gal

pairs(Gal[,c(1,3,4,5,6,7)])

pairs(Gal[,(2:7)], lower.panel=NULL)


par(mfrow=c(2,5))
for(j in (1:2)){
  for(i in (3:7)){plot(Gal[,j],Gal[,i],xlab=colnames(Gal)[i],ylab=colnames(Gal)[j])}}


par(mfrow=c(2,5))
for(j in (1:2)){
  for(i in (3:7)){plot(log(Gal[,j]),Gal[,i],xlab=colnames(Gal)[i],ylab=paste("log",colnames(Gal)[j]))}}
par(mfrow=c(1,1))


par(mfrow=c(2,5))
for(j in (1:2)){
  for(i in (3:7)){plot(log(Gal[,j]),log(Gal[,i]),xlab=paste("log",colnames(Gal)[i]),ylab=paste("log",colnames(Gal)[j]))}}
par(mfrow=c(1,1))




#### Models per Nombre d'Especies.

# Model de y versus les cinc x's

modelyx = lm(No.Esp.~Area+Eleva.+D.Near+D.StCruz+A.Adj., Gal)
summary(modelyx)

plot(predict(modelyx),rstandard(modelyx))
abline(h=c(-2,0,2),lty=2)

qqnorm(rstandard(modelyx))
# Fallen hipotesi de linealitat, varianca constant i normalitat
# El model no ajusta be.




# Model de logy versus les cinc x's

modellyx = lm(log(No.Esp.)~Area+Eleva.+D.Near+D.StCruz+A.Adj., Gal)
summary(modellyx)

plot(predict(modellyx),rstandard(modellyx))
abline(h=c(-2,0,2),lty=2)

qqnorm(rstandard(modellyx))
# El model ajusta molt mes be




# Model de logy versus les cinc logx's

modellylx = lm(log(No.Esp.)~log(Area)+log(Eleva.)+log(D.Near)+log(D.StCruz+.01)+log(A.Adj.), Gal)
summary(modellylx)

plot(predict(modellylx),rstandard(modellylx))
abline(h=c(-2,0,2),lty=2)

qqnorm(rstandard(modellylx))
# El model ajusta tant o mes be que l'anterior, i te R2 i R2adj mes grans



# Model log y versus logArea

modellylA = lm(log(No.Esp.)~log(Area), Gal)
summary(modellylA)

plot(predict(modellylA),rstandard(modellylA))
abline(h=c(-2,0,2),lty=2)

qqnorm(rstandard(modellylA))


# Comprovacio de que tenia sentit eliminar les quatre variables de cop
anova(modellylA,modellylx)


scatterplot(log(No.Esp.)~log(Area), box=F,smooth=F,Gal)

# A aquest model tambe s'hi podia haver arribat ajustant el model amb totes les
# cinc variables logx, i anar-les eliminant d'una en una en funcio del tvalue

# Tambe es podria mirar de combinar logx's amb x's o amb altres variables







#### Models per Endemiques.

# Feu-lo vosaltres. Funciona tot molt semblant.



