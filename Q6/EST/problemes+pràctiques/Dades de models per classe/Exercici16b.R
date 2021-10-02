
library(car)
library(emmeans)

Vitc = read.csv2("vitc.csv")
head(Vitc)

Vitc$tract = factor(Vitc$tract)

scatterplot(vitc~set|tract,smooth=F,regLine=F,Vitc)

scatterplot(vitc~set|tract,smooth=F,Vitc)



scatterplot(log(vitc)~set|tract,smooth=F,regLine=F,Vitc)

scatterplot(log(vitc)~set|tract,smooth=F,Vitc)





## Pregunta a). La interseccio amb l'origen (b0) ha de ser la mateixa per
# tots els tractaments. Per aixo no es posa l'efecte principal tractament
# al model

mlvita = lm(log(vitc)~set+tract:set,Vitc)
summary(mlvita)

plot(predict(mlvita),rstandard(mlvita))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mlvita))

emmip(mlvita,tract~set,at=list(set=(0:6)*2),CIs=T)




## Pregunta b). Incloent l'efecte principal tractament al model, podrem 
# comprovar si les tres b0 son iguals

mlvit = lm(log(vitc)~tract*set,Vitc)
summary(mlvit)

plot(predict(mlvit),rstandard(mlvit))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mlvit))

emmip(mlvit,tract~set,at=list(set=(0:6)*2),CIs=T)

anova(mlvita,mlvit)
# No es rebutja la hipotesi que diu que l'efecte principal tractament 
# es igual a zero. Per tant les tres interseccions amb l'origen son iguals.
# Escollim el model mlvita

# Treure efecte principal sense treure interaccio nomes te sentit si el que
# es vol es contestar una pregunta d'aquest estil.



# La seguent funcio dona els pendents per cada grup, i els seus I de Confianca
emtrends(mlvita,~tract,var="set")

emtrends(mlvit,~tract,var="set")



## Pregunta c)

# Ja s'ha fet via grafics de residus contra valors previstos i qqnorm plots

#plot(mlvita,ask=F)
