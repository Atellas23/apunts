
library(car)

Bw = read.csv2("BirthWeight0.csv")
head(Bw)

pairs(~bwt+age+lwt,lower.panel=NULL,col=as.integer(Bw$race),Bw)

pairs(~bwt+age+lwt,lower.panel=NULL,col=as.integer(Bw$smoke)+1,Bw)

Bw$race = as.factor(Bw$race)
Bw$smoke = as.factor(Bw$smoke)
Bw$ht = as.factor(Bw$ht)
Bw$ui = as.factor(Bw$ui)

# ptl i ftv no son variables categoriques. Son discretes i per tant no s'han
# de tractar com a factors.




# Models per bwt versus tote les explicatives. Model additiu. Plans paral.lels.

modela = lm(bwt~age+lwt+race+smoke+ht+ui+ptl+ftv, Bw)
summary(modela)

plot(predict(modela),rstandard(modela), col=as.integer(Bw$race))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modela))

# Simplificacio del model eliminant d'una en una variables que no semblen importants

modela1 = lm(bwt~age+lwt+race+smoke+ht+ui+ptl, Bw)
summary(modela1)

modela2 = lm(bwt~age+lwt+race+smoke+ht+ui, Bw)
summary(modela2)

modela3 = lm(bwt~lwt+race+smoke+ht+ui, Bw)
summary(modela3)

# Comprovacio de que els residus segueixen sent acceptables i que es
# podien haver tret les tres variables de cop.

plot(predict(modela3),rstandard(modela3), col=as.integer(Bw$race))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modela3))

anova(modela3,modela)




# Model per bwt amb interaccions. Plans qualsevols.
# ptl i ftv s'inclouen de forma additiva per no tenir problemes de colinealitat.

modelint = lm(bwt ~ (age+lwt)*race+(age+lwt)*smoke+(age+lwt)*ht+(age+lwt)*ui+ptl+ftv, Bw)
summary(modelint)

plot(predict(modelint),rstandard(modelint), col=as.integer(Bw$race))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modelint))


# Treiem primer ptl i ftv perque no tenen interaccions i tenen |tvalues| petits
modelint1 = lm(bwt ~ (age+lwt)*race+(age+lwt)*smoke+(age+lwt)*ht+(age+lwt)*ui, Bw)
summary(modelint1)

# Comprovacio de que es podien treure les dues variables a l'hora
anova(modelint1,modelint)


# Eliminem ara les interaccions que no semblen significatives, una a una

modelint2 = lm(bwt ~ (age+lwt)*race+(age+lwt)*smoke+(age+lwt)*ht+ lwt*ui, Bw)
summary(modelint2)

modelint3 = lm(bwt ~ (age+lwt)*race+(age+lwt)*smoke+(age+lwt)*ht+ui, Bw)
summary(modelint3)

modelint4 = lm(bwt ~ (age+lwt)*race+age*smoke+(age+lwt)*ht+ui, Bw)
summary(modelint4)

modelint5 = lm(bwt ~ lwt*race+age*smoke+(age+lwt)*ht+ui, Bw)
summary(modelint5)
anova(modelint5,modelint4)

modelint6 = lm(bwt ~ race+age*smoke+(age+lwt)*ht+ui, Bw)
summary(modelint6)
anova(modelint6,modelint5)


# Comprovacio (redundant) de que els residus segueixen sent acceptables,
# i de que podria haver tret totes aquestes interaccions de cop.

plot(predict(modelint6),rstandard(modelint6), col=as.integer(Bw$race))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modelint6))

anova(modelint6,modelint)



# No podem eliminar cap dels efectes principals perque tots o be tenen un 
# |tvalue| gran o be apareixen en alguna interaccio significativa.

# Per tant, el model final que hem d'interpretar es:

summary(modelint6)

# Com interpretes aquest model final?





