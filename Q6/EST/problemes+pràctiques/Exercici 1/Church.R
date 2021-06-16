
library(car)

Church = read.csv2("Church0.csv")
head(Church)

plot(Church$Area,Church$Perimeter)

modelPA = lm(Perimeter~Area, Church)
summary(modelPA)

scatterplot(Perimeter~Area, box=F,smooth=F,Church)

# Validar linealitat, varianca constant i valors estranys
plot(predict(modelPA),resid(modelPA))
abline(h=0,lty=2)
plot(predict(modelPA),rstandard(modelPA))
abline(h=c(-2,0,2),lty=2)

# Validar normalitat
qqnorm(rstandard(modelPA))




plot(log(Church$Area),log(Church$Perimeter))

modelLPLA = lm(log(Perimeter)~log(Area), Church)
summary(modelLPLA)

scatterplot(log(Perimeter)~log(Area), box=F,smooth=F,Church)

plot(predict(modelLPLA),resid(modelLPLA))
abline(h=0,lty=2)
plot(predict(modelLPLA),rstandard(modelLPLA))
abline(h=c(-2,0,2),lty=2)

# Validar normalitat
qqnorm(rstandard(modelLPLA))
