
library(car)


Garr = read.csv2("gmd.csv")
head(Garr)

Garr$DOSI = factor(Garr$DOSI)

Garr

scatterplot(GMD~DOSI,Garr)

library(RcmdrMisc)
with(Garr,plotMeans(GMD,DOSI,error.bars="sd"))
with(Garr,plotMeans(GMD,DOSI,error.bars="conf.int",level=0.95))


## Pregunta a) Fer-ho a ma.




## Pregunta b)


model1 = lm(GMD~0+DOSI,x=T,Garr)
summary(model1)


model2 = lm(GMD~DOSI,x=T,contrasts=list(DOSI="contr.sum"),Garr)
summary(model2)


model3 = lm(GMD~DOSI,x=T,contrasts=list(DOSI="contr.treatment"),Garr)
summary(model3)


modeld = lm(GMD~DOSI,x=T,Garr)
summary(modeld)

#La parametritzacio utilitzada per defecte, modeld, es la de model3


model1$x

model2$x

model3$x

modeld$x


cbind(predict(model1),predict(model2),predict(model3))



## Pregunta c)

# Aqui fem la prova d'hipotesi per comprovar si les mitjanes de les cinc
# poblacions son totes iguals. L'estadistic F i el pvalor que s'obte
# fent anova(modelc,model*) son els mateixos que et dona summary(model*)

modelc = lm(GMD~1,x=T,Garr)
summary(modelc)

summary(model1)
anova(modelc,model1)

summary(model2)
anova(modelc,model2)

summary(model3)
anova(modelc,model3)

# Fare servir la parametritzacio per defecte, model3. L'analisi de
# residus es identic per les tres parametritzacions


plot(predict(model3),rstandard(model3))
abline(h=0,lty=2)



## Pregunta d). Fa falta llibreria emmeans

library(emmeans)

emmip(model3,~DOSI)

# El seguent grafic es com el generat al principi amb plotMeans(), amb la 
# unica diferencia de que aqui la variabilitat per l'estimacio de cada mitjana
# utilitza totes les 25 observacions i no nomes les 5 propies de cada tractament.
# Aprofitem les estimacions del model per aixo.
emmip(model3,~DOSI,CIs=T)

emm3 = emmeans(model3,~DOSI)
emm3

confint(emm3, level=0.95)

pairs(emm3)

#pwpp(emm3)


