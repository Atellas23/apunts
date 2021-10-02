
library(car)
library(emmeans)


Pr2f = read.csv2("prac2f.csv")
head(Pr2f)

Pr2f$F1 = factor(Pr2f$F1)
Pr2f$F2 = factor(Pr2f$F2)


## Cas V1

library(RcmdrMisc)
with(Pr2f,plotMeans(V1,F2,F1,error.bars="conf.int",level=0.95,connect=TRUE))

with(Pr2f,plotMeans(V1,F1,F2,error.bars="conf.int",level=0.95,connect=TRUE))

# Ajust model no additiu
m1na = lm(V1~F1*F2,Pr2f)
summary(m1na)

plot(predict(m1na),rstandard(m1na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m1na))


# Ajust model additiu
m1a = lm(V1~F1+F2,Pr2f)
summary(m1a)

plot(predict(m1a),rstandard(m1a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m1a))


# Comparacio dels models additiu i no additiu, amb i sense interaccions
anova(m1a,m1na)


# Com que les interaccions son significatives, farem servir el model
# amb interaccions (el no additiu) per interpretar mitjanes
emmip(m1na, F1~F2, CIs=T)

emmip(m1na, F2~F1, CIs=T)


emm1 = emmeans(m1na,~F1*F2)
emm1

pairs(emm1)





# Cas V2

library(RcmdrMisc)
with(Pr2f,plotMeans(V2,F2,F1,error.bars="conf.int",level=0.95,connect=TRUE))

with(Pr2f,plotMeans(V2,F1,F2,error.bars="conf.int",level=0.95,connect=TRUE))


m2na = lm(V2~F1*F2,Pr2f)
summary(m2na)

plot(predict(m2na),rstandard(m2na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m2na))


m2a = lm(V2~F1+F2,Pr2f)
summary(m2a)

plot(predict(m2a),rstandard(m2a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m2a))


anova(m2a,m2na)



# Com que les interaccions no son significatives, farem servir el model additiu
# sense interaccions. 
# Com que els dos factors son significatius, no se'n pot eliminar cap del model
emmip(m2a, F1~F2, CIs=T)

emmip(m2a, F2~F1, CIs=T)

emm2 = emmeans(m2a,~F1*F2)
emm2

pairs(emm2)





# Cas V3

library(RcmdrMisc)
with(Pr2f,plotMeans(V3,F2,F1,error.bars="conf.int",level=0.95,connect=TRUE))

with(Pr2f,plotMeans(V3,F1,F2,error.bars="conf.int",level=0.95,connect=TRUE))


m3na = lm(V3~F1*F2,Pr2f)
summary(m3na)

plot(predict(m3na),rstandard(m3na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m3na))


m3a = lm(V3~F1+F2,Pr2f)
summary(m3a)

plot(predict(m3a),rstandard(m3a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m3a))


anova(m3a,m3na)



# Com que les interaccions son significatives, farem servir el model no additiu
# amb interaccions
emmip(m3na, F1~F2, CIs=T)

emmip(m3na, F2~F1, CIs=T)

emm3 = emmeans(m3na,~F1*F2)
emm3

pairs(emm3)






# Cas V4

library(RcmdrMisc)
with(Pr2f,plotMeans(V4,F2,F1,error.bars="conf.int",level=0.95,connect=TRUE))

with(Pr2f,plotMeans(V4,F1,F2,error.bars="conf.int",level=0.95,connect=TRUE))


m4na = lm(V4~F1*F2,Pr2f)
summary(m4na)

plot(predict(m4na),rstandard(m4na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m4na))


m4a = lm(V4~F1+F2,Pr2f)
summary(m4a)

plot(predict(m4a),rstandard(m4a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m4a))


anova(m4a,m4na)


# Com que les interaccions no son significatives, farem servir el model additiu
# (sense interaccions) per interpretar el que passa. 

# Pero com que els coeficients del Factor 1 tenen |tvalues| petits, hem de 
# comprovar si aquest factor es necessari comparant el model additiu amb dos
# factors, m4a, amb el model que nomes te el factor 2

m4F2 = lm(V4~F2,Pr2f)
summary(m4F2)

plot(predict(m4F2),rstandard(m4F2))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m4F2))


anova(m4F2,m4a)



# Ens quedem per tant nomes amb el model amb nomes el F2

emmip(m4F2, ~F2, CIs=T)

emm4F2 = emmeans(m4F2,~F2)
emm4F2

pairs(emm4F2)






# Cas V5

library(RcmdrMisc)
with(Pr2f,plotMeans(V5,F2,F1,error.bars="conf.int",level=0.95,connect=TRUE))

with(Pr2f,plotMeans(V5,F1,F2,error.bars="conf.int",level=0.95,connect=TRUE))


m5na = lm(V5~F1*F2,Pr2f)
summary(m5na)

plot(predict(m5na),rstandard(m5na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m5na))


m5a = lm(V5~F1+F2,Pr2f)
summary(m5a)

plot(predict(m5a),rstudent(m5a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m5a))

anova(m5a,m5na)


# Com que les interaccions son significatives, farem servir el model no additiu
# (amb interaccions)
emmip(m5na, F1~F2, CIs=T)

emmip(m5na, F2~F1, CIs=T)

emm5 = emmeans(m5na,~F1*F2)
emm5

pairs(emm5)






# Cas V6

library(RcmdrMisc)
with(Pr2f,plotMeans(V6,F2,F1,error.bars="conf.int",level=0.95,connect=TRUE))

with(Pr2f,plotMeans(V6,F1,F2,error.bars="conf.int",level=0.95,connect=TRUE))


m6na = lm(V6~F1*F2,Pr2f)
summary(m6na)

plot(predict(m6na),rstandard(m6na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m6na))


m6a = lm(V6~F1+F2,Pr2f)
summary(m6a)

plot(predict(m6a),rstudent(m6a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(m6a))

anova(m6a,m6na)



# Com que les interaccions no son significatives, podem fer servir el model additiu
# (sense interaccions)
emmip(m6a, F1~F2, CIs=T)

emmip(m6a, F2~F1, CIs=T)

emm6 = emmeans(m6a,~F1+F2)
emm6

pairs(emm6)

# Pero en realitat en el model additiu sembla que ni F1 ni F2 son significatius.
# A continuacio ho comprovem.

m6F1 = lm(V6~F1,Pr2f)
summary(m6F1)
anova(m6F1,m6a)

m6F2 = lm(V6~F2,Pr2f)
summary(m6F2)
anova(m6F2,m6a)

# Per tant la conclusio bona es que en aquest cas no hi ha model, i totes
# les 12 mitjanes son iguals


