
library(car)

Soma = read.csv2("Berkeley0.csv")
head(Soma)

pairs(Soma[,(1:7)], lower.panel=NULL,col=as.integer(Soma[,12])+1)



# Models per SOMA versus les set x's. Model additiu. Plans paral.lels.

modelyx = lm(soma~wght2+hght2+wght9+hght9+leg9+st9+sex, Soma)
summary(modelyx)

plot(predict(modelyx),rstandard(modelyx), col=as.integer(Soma[,12])+1 )
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modelyx))


# Simplifiquem el model, treient les variables que no semblen importants

modelyx1 = lm(soma~wght2+hght2+wght9+hght9+st9+sex, Soma)
summary(modelyx1)

modelyx2 = lm(soma~wght2+wght9+hght9+st9+sex, Soma)
summary(modelyx2)

modelyx3 = lm(soma~wght2+wght9+hght9+sex, Soma)
summary(modelyx3)

# Comprovem que es podien haver tret les tres variables de cop

anova(modelyx3,modelyx)

# (Com interpretes el signe del coeficient de wght2?)





# Models per SOMA versus les sis x's i sex, amb interaccions (productes). 
# Plans qualsevols.

Soma$sex
Soma$sex = factor(Soma$sex)
Soma$sex

modelyxint = lm(soma~(wght2+hght2+wght9+hght9+leg9+st9)*sex, Soma)
summary(modelyxint)

plot(predict(modelyxint),rstandard(modelyxint), col=as.integer(Soma[,12])+1 )
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modelyxint))


# Simplifiquem el model treient les interaccions que no semblen importants

modelyxint1 = lm(soma~(wght2+hght2+wght9+hght9+st9)*sex + leg9, Soma)
summary(modelyxint1)

modelyxint2 = lm(soma~(wght2+hght2+wght9+st9)*sex + hght9 + leg9 , Soma)
summary(modelyxint2)

modelyxint3 = lm(soma~(wght2+wght9+st9)*sex + hght2 + hght9 + leg9 , Soma)
summary(modelyxint3)

modelyxint4 = lm(soma~(wght9+st9)*sex + wght2 + hght2 + hght9 + leg9 , Soma)
summary(modelyxint4)

modelyxint5 = lm(soma~(st9)*sex + wght2 + hght2 + wght9 + hght9 + leg9 , Soma)
summary(modelyxint5)


# Un cop ja no es poden treure mes interaccions, treiem tots els efectes
# lineals que no son significativament diferents de 0 i no apareixen en
# cap de les interaccions que queden al model.

modelyxint6 = lm(soma ~ st9*sex + wght2 + hght2 + wght9 + hght9, Soma)
summary(modelyxint6)

modelyxint7 = lm(soma ~ st9*sex + wght2 + wght9 + hght9, Soma)
summary(modelyxint7)


# Comprovacio de que es podien haver tret de cop totes les interaccions i 
# variables que hem tret, i de que els residus segueixen sent acceptables

anova(modelyxint7,modelyxint)

plot(predict(modelyxint7),rstandard(modelyxint7), col=as.integer(Soma[,12])+1 )
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modelyxint7))


# Com interpretes el model resultant?

summary(modelyxint7)



