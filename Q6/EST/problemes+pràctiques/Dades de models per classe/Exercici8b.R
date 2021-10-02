
library(car)
library(emmeans)

Pate = read.csv2("pate.csv")
head(Pate)

Pate$notaf = (Pate$color+Pate$aroma+Pate$text+Pate$sabor)/4

# L'exercici el faig primer per nota final en comptes de per cada una de les
# variables per separat.

Pate$per = factor(Pate$per)
Pate$pate = factor(Pate$pate)

head(Pate)
Pate

scatterplot(notaf~pate,Pate)
scatterplot(notaf~per,Pate)

library(RcmdrMisc)
with(Pate,plotMeans(notaf,pate,per,error.bars="conf.int",level=0.95,connect=TRUE))

with(Pate,plotMeans(notaf,per,pate,error.bars="conf.int",level=0.95,connect=TRUE))



## Pregunta a). Fer-la a ma.





## Pregunta b). Com que no hi ha repliques, no es pot ajustar el model
## amb interaccions. Ajustem el model additiu

modelntf = lm(notaf~pate+per,x=T,Pate)
summary(modelntf)

modelntf$x

# El model ajusta be
plot(predict(modelntf),rstandard(modelntf))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modelntf))




## Pregunta c). Fet per nota final, 


modelntfPate = lm(notaf~pate, Pate)
summary(modelntfPate)

modelntfPers = lm(notaf~per, Pate)
summary(modelntfPers)



# Test per saber si hi ha diferencia entre pates
anova(modelntfPers,modelntf)
# La diferencia sembla significativa pels pels, perque pvalor=0.04

# Test per saber si hi ha diferencia entre persones
anova(modelntfPate,modelntf)
# Hi ha diferencia significativa entre persones




library(emmeans)

emmip(modelntf,~pate,CIs=T)

emmip(modelntf,pate~per,CIs=T)





## Pregunta d). Repetir sense tenir en compte l'efecte persona (tastador)

modelntfPate = lm(notaf~pate, Pate)
summary(modelntfPate)

plot(predict(modelntfPate),rstandard(modelntfPate))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(modelntfPate))
# No hi ha diferencia significativa entre pates. 

# No cal fer comparacions de pates per separat, pero no fare de totes maneres

emmip(modelntfPate,~pate,CIs=T)










############# Comparacio per notes individuals

modelcol = lm(color~pate+per,Pate)
summary(modelcol)

modelaro = lm(aroma~pate+per,Pate)
summary(modelaro)

modeltxt = lm(text~pate+per,Pate)
summary(modeltxt)

modelsab = lm(sabor~pate+per,Pate)
summary(modelsab)




modelcol0 = lm(color~pate,Pate)
summary(modelcol0)
anova(modelcol0,modelcol)

modelaro0 = lm(aroma~pate,Pate)
summary(modelaro0)
anova(modelaro0,modelaro)

modeltxt0 = lm(text~pate,Pate)
summary(modeltxt0)
anova(modeltxt0,modeltxt)

modelsab0 = lm(sabor~pate,Pate)
summary(modelsab0)
anova(modelsab0,modelsab)




modelcol1 = lm(color~per,Pate)
summary(modelcol1)
anova(modelcol1,modelcol)

modelaro1 = lm(aroma~per,Pate)
summary(modelaro1)
anova(modelaro1,modelaro)

modeltxt1 = lm(text~per,Pate)
summary(modeltxt1)
anova(modeltxt1,modeltxt)

modelsab1 = lm(sabor~per,Pate)
summary(modelsab1)
anova(modelsab1,modelsab)
