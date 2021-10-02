
library(car)
library(emmeans)

Area = read.csv2("area.csv")
head(Area)

Area$ESPECIE = factor(Area$ESPECIE)
Area$COMPOST = factor(Area$COMPOST)

library(RcmdrMisc)
with(Area,plotMeans(AREA,ESPECIE,COMPOST,error.bars="conf.int",level=0.95))

with(Area,plotMeans(AREA,COMPOST,ESPECIE,error.bars="conf.int",level=0.95))



## Pregunta a)



# Model no additiu, amb interaccions
mareanad = lm(AREA~ESPECIE*COMPOST,Area)
summary(mareanad)

plot(predict(mareanad),rstandard(mareanad))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(mareanad))

# El model te residus dolents i per tant, no el podem fer servir per
# fer proves d'hipotesi ni comparacions multiples. No te sentit comparar aquests
# model amb l'additiu fent servir tvalues ni F's. No podem assumir que la
# interaccio no es rellevant nomes en base a que el tvalue=0.55

# Hem d'arreglar el model.









## Pregunta b)

Area$lgAREA = log(Area$AREA)

# Model no additiu, amb interaccions.
mlareanad = lm(lgAREA~ESPECIE*COMPOST,x=T,Area)
summary(mlareanad)

plot(predict(mlareanad),rstudent(mlareanad))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstudent(mlareanad))

# Com que els residus son acceptables, i la interaccio es significativa
# ja no cal provar el model additiu. El model bo es aquest.
# Especie i Compost interaccionen. L'efecte d'Especie sobre Area
# depen del nivell de Compost, i l'efecte de Compost sobre Area
# depen de l'Especie


emmip(mlareanad, ESPECIE~COMPOST, CIs=T)

emmip(mlareanad, COMPOST~ESPECIE, CIs=T)

emmlanad = emmeans(mlareanad,~ESPECIE*COMPOST)
emmlanad

pairs(emmlanad)



