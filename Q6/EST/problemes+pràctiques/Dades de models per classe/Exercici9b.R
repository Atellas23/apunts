
library(car)
library(emmeans)


Form = read.csv2("formatges.csv")
head(Form)

Form$TERMIC = factor(Form$TERMIC)
Form$CaCl2 = factor(Form$CaCl2)




## Llet de vaca

library(RcmdrMisc)
with(Form,plotMeans(R_VACA,TERMIC,CaCl2,error.bars="conf.int",level=0.95,connect=TRUE))

with(Form,plotMeans(R_VACA,CaCl2,TERMIC,error.bars="conf.int",level=0.95,connect=TRUE))



modelvnoad = lm(R_VACA~TERMIC*CaCl2,x=T,Form)
summary(modelvnoad)
# La interaccio es significativa. Ja no cal provar el model additiu.

plot(predict(modelvnoad),rstandard(modelvnoad))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstudent(modelvnoad))


#modelvad = lm(R_VACA~TERMIC+CaCl2,x=T,Form)
#summary(modelvad)
#plot(predict(modelvad),rstandard(modelvad))
#abline(h=c(-2,0,2),lty=2)
#qqnorm(rstudent(modelvad))
#anova(modelvnoad,modelvad)



# Que els dos factors interaccionin vol dir que l'efecte del tractament
# termic sobre el rendiment depen del nivel de CaCl2, i tambe que
# l'efecte del nivell de CaCl2 sobre el rendiment depen del tractament.
# No hi ha paral.lelisme.
#
# Es trien els grafics que s'ensenyen en funcio del model escollit.

emmip(modelvnoad,TERMIC~CaCl2,CIs=TRUE)

emmip(modelvnoad,CaCl2~TERMIC,CIs=TRUE)

emmv = emmeans(modelvnoad,~TERMIC*CaCl2)
emmv

confint(emmv)

pairs(emmv)






## Llet de cabra

with(Form,plotMeans(R_CABRA,TERMIC,CaCl2,error.bars="conf.int",level=0.95,connect=TRUE))

with(Form,plotMeans(R_CABRA,CaCl2,TERMIC,error.bars="conf.int",level=0.95,connect=TRUE))



mcnoad = lm(R_CABRA~TERMIC*CaCl2,x=T,Form)
summary(mcnoad)
# Aqui la interaccio no es significativa. Per tant cal simplificar el model

plot(predict(mcnoad),rstandard(mcnoad))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mcnoad))



mcad = lm(R_CABRA~TERMIC+CaCl2,x=T,Form)
summary(mcad)

plot(predict(mcad),rstandard(mcad))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mcad))

anova(mcnoad,mcad)



# Que aqui els dos factors no interaccionin vol dir que l'efecte del tractament
# termic sobre el rendiment no depen del nivel de CaCl2, i tambe que
# l'efecte del nivell de CaCl2 sobre el rendiment no depen del tractament.
#
# Hi ha paral.lelisme.

emmip(mcad,TERMIC~CaCl2,CIs=TRUE)

emmip(mcad,CaCl2~TERMIC,CIs=TRUE)

emmc = emmeans(mcad,~TERMIC+CaCl2)
emmc

pairs(emmc)



# Com que aqui l'efecte CaCl2 sembla poc significatiu, te sentit treure'l
# i ajustar el model que nomes te l'efecte tractament termic

mcT = lm(R_CABRA~TERMIC,x=T,Form)
summary(mcT)

plot(predict(mcT),rstandard(mcT))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mcT))

emmip(mcT,~TERMIC,CIs=TRUE)
# L'efecte de tractament termic aqui es molt poc significatiu (pvalor=0.065).






## Llet d'ovella

with(Form,plotMeans(R_OVELLA,TERMIC,CaCl2,error.bars="conf.int",level=0.95,connect=TRUE))

with(Form,plotMeans(R_OVELLA,CaCl2,TERMIC,error.bars="conf.int",level=0.95,connect=TRUE))



monoad = lm(R_OVELLA~TERMIC*CaCl2,x=T,Form)
summary(monoad)
# La interaccio no es significativa. Cal simplificar el model.

plot(predict(monoad),rstandard(monoad))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(monoad))



moad = lm(R_OVELLA~TERMIC+CaCl2,x=T,Form)
summary(moad)

plot(predict(moad),rstandard(moad))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(moad))



# Que aqui els dos factors no interaccionin vol dir que l'efecte del tractament
# termic sobre el rendiment no depen del nivel de CaCl2, i tambe que
# l'efecte del nivell de CaCl2 sobre el rendiment no depen del tractament.
#
# Hi ha paral.lelisme.

emmip(moad,TERMIC~CaCl2,CIs=TRUE)

emmip(moad,CaCl2~TERMIC,CIs=TRUE)

emmo = emmeans(moad,~TERMIC*CaCl2)
emmo

pairs(emmo)


