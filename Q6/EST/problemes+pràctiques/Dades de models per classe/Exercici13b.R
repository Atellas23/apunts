
library(car)
library(emmeans)

Com = read.csv2("comrect.csv")
head(Com)

Com$M = factor(Com$M)



## Cas V

scatterplot(V~C|M,smooth=F,regLine=F,Com)

scatterplot(V~C|M,smooth=F,Com)


# Rectes diferents
mvna = lm(V~M+C+M:C,Com)
#tambe es pot escriure mvna = lm(V~M*C,Com)
summary(mvna)

plot(predict(mvna),rstandard(mvna))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mvna))


# Rectes paral.leles
mva = lm(V~M+C,Com)
summary(mva)

plot(predict(mva),rstandard(mva))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mva))

anova(mva,mvna)


# El model bo es l'additiu amb M i C. Es veu tant via tvalue com via anova(,)
emmip(mva,M~C,CIs=T,at=list(C=c(90,105,120)))


# La seguent funcio dona els pendents per cada grup, i els seus I de Confianca
emtrends(mva,~M,var="C")


# Si vols comprovar si les dues rectes son iguals
#mvC = lm(V~C,Com)
#summary(mvC)
#plot(predict(mvC),rstandard(mvC))
#abline(h=c(-2,0,2),lty=2)
#qqnorm(rstandard(mvC))
#anova(mvC,mva)
# El cas de rectes iguals ja sabem que no es bo perque el |tvalue| de M 
# al model mva es gran






# Cas VV

scatterplot(VV~C|M,smooth=F,regLine=F,Com)

scatterplot(VV~C|M,smooth=F,Com)


# Rectes diferents
mvvna = lm(VV~M+C+M:C,Com)
#tambe es pot fer mvvna = lm(VV~M*C,Com)
summary(mvvna)

plot(predict(mvvna),rstandard(mvvna))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mvvna))


# Rectes paral.leles
mvva = lm(VV~M+C,Com)
summary(mvva)

plot(predict(mvva),rstandard(mvva))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mvva))

anova(mvva,mvvna)


# Aqui el model bo es el no additiu. Ja no cal comprovar el
# model amb rectes paral.leles o amb rectes iguals.
emmip(mvvna,M~C,CIs=T,at=list(C=c(90,105,120)))


# La seguent funcio dona els pendents per cada grup, i els seus I de Confianca
emtrends(mvvna,~M,var="C")

