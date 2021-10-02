setwd("C:/Users/alexb/apunts/Q6/EST/problemes+pràctiques/Exercici 1")
library(car)

Brains = read.csv2("Brains0.csv")
head(Brains)

plot(Brains$BodyWeight, Brains$BrainWeight)

modelBB = lm(BrainWeight~BodyWeight, Brains)
summary(modelBB)

scatterplot(BrainWeight ~ BodyWeight,box=F,smooth=F,Brains)

# Validar linealitat, varianca constant i valors estranys
plot(predict(modelBB),rstandard(modelBB))
abline(h=c(-2,0,2),lty=2)
plot(predict(modelBB),rstudent(modelBB))
abline(h=c(-2,0,2),lty=2)
text(2600,11.35,"Asian Elephant")
text(150,4.75,"Human")
text(6050,-11,"African Elephant")



plot(rstandard(modelBB))
abline(h=c(-2,0,2),lty=2)
text(19,6.95,"Asian Elephant")
text(32,4,"Human")
text(33,-6,"African Elephant")

# Validar normalitat
qqnorm(rstandard(modelBB))




plot(log(Brains$BodyWeight), log(Brains$BrainWeight))

modelLBLB = lm(log(BrainWeight)~log(BodyWeight), Brains)
summary(modelLBLB)

scatterplot(log(BrainWeight)~log(BodyWeight),box=F,smooth=F,Brains)

# Validar linealitat, varianca constant i valors estranys
plot(predict(modelLBLB),rstandard(modelLBLB))
abline(h=c(-2,0,2),lty=2)

plot(rstandard(modelLBLB))
abline(h=c(-2,0,2),lty=2)
text(19,0.9,"Asian Elephant")
text(32,2.85,"Human")
text(33,0.2,"African Elephant")

# Validar normalitat
qqnorm(rstandard(modelLBLB))




# Sobre es residus dels primats

primate = c(2,9,24,29,32,35,41,46,47)
Brains$Column_1.T[primate]
rstandard(modelLBLB)[primate]

plot(rstandard(modelLBLB))
abline(h=c(-2,0,2),lty=2)
points(primate,rstandard(modelLBLB)[primate],col="Red")

plot(predict(modelLBLB),rstandard(modelLBLB))
abline(h=c(-2,0,2),lty=2)
points(predict(modelLBLB)[primate],rstandard(modelLBLB)[primate],col="Red")

plot(log(Brains$BodyWeight), log(Brains$BrainWeight))
abline(modelLBLB$coeff)
points(log(Brains$BodyWeight)[primate], log(Brains$BrainWeight)[primate],col="Red")




# Sobre barrejar dinosaures i mamifers

colnames(Brains)

Column_1.T = c("Diplodocus","Triceratops","Brachiosaurus")
BodyWeight = c(11700,9400,87000)
BrainWeight = c(50,70,154.5)
BrainsD = data.frame(Column_1.T,BodyWeight,BrainWeight)

TotBrains = rbind(Brains,BrainsD)
head(TotBrains)

plot(log(TotBrains$BodyWeight), log(TotBrains$BrainWeight))

modelTLBLB = lm(log(BrainWeight)~log(BodyWeight), TotBrains)
summary(modelTLBLB)

scatterplot(log(BrainWeight)~log(BodyWeight),box=F,smooth=F,TotBrains)

# Validar linealitat, varianca constant i valors estranys
plot(predict(modelTLBLB),rstandard(modelTLBLB))
abline(h=c(-2,0,2),lty=2)
plot(predict(modelTLBLB),rstudent(modelTLBLB))
abline(h=c(-2,0,2),lty=2)




# Ajust del model fent servir criteri robust en comptes de minims quadrats
# lmsreg ajusta el model minimitzant la mediana del valor absolut dels residus

library(MASS)

modelRbTLBLB = lmsreg(log(BrainWeight)~log(BodyWeight), TotBrains)
summary(modelRbTLBLB)

plot(log(TotBrains$BodyWeight),log(TotBrains$BrainWeight))
abline(modelRbTLBLB$coefficients, col="red")
abline(modelTLBLB$coefficients)

plot(predict(modelRbTLBLB),resid(modelRbTLBLB))
abline(h=c(-2,0,2),lty=2)

plot(predict(modelTLBLB),rstandard(modelTLBLB))
abline(h=c(-2,0,2),lty=2)


# Ajust del model fent servir un altre criteri robust
# lmrob fa servir el criteri MM d'estimacio. Busqueu-lo a google.

#library(robustbase)

#modelRobTLBLB = lmrob(log(BrainWeight)~log(BodyWeight), TotBrains)
#summary(modelRobTLBLB)

#plot(log(TotBrains$BodyWeight),log(TotBrains$BrainWeight))
#abline(modelRobTLBLB$coefficients)
#abline(modelTLBLB$coefficients, col="blue")

#plot(predict(modelRobTLBLB),resid(modelRobTLBLB))
#abline(h=c(-2,0,2),lty=2)

#plot(predict(modelTLBLB),rstandard(modelTLBLB))
#abline(h=c(-2,0,2),lty=2)
