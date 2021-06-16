
library(car)

Col = read.csv2("col.csv")
head(Col)

pairs(~C+P+H+E,Col)


# Pregunta a). Fer-la a ma.




# Pregunta b).

modelPHE = lm(C~P+H+E,Col)
summary(modelPHE)


Col$EP = Col$P+10-0.5*Col$H

modelEPHE = lm(C~EP+H+E,Col)
summary(modelEPHE)


# Comprovacio de que relacio P i H es semblant a la que hem suposat
modelPvsH = lm(P~H,Col)
summary(modelPvsH)




## Pregunta b) (1).

plot(predict(modelPHE))
points(predict(modelEPHE), pch=3, col="green")

plot(resid(modelPHE))
points(resid(modelEPHE), pch=3, col="green")

plot(rstudent(modelPHE))
points(rstudent(modelEPHE), pch=3, col="green")

summary(modelPHE)
summary(modelEPHE)

(model0 = lm(C~1,Col))

anova(model0,modelPHE)
anova(model0,modelEPHE)


## Pregunta b) (2).

vif(modelPHE)
vif(modelEPHE)


## Pregunta b) (3).

summary(modelPHE)
summary(modelEPHE)

confint(modelPHE)
confint(modelEPHE)


## Pregunta b) (4)

# Amb EP al model, H deixa de ser rellevant


## Pregunta b) (5)

modelEPE = lm(C~EP+E,Col)
summary(modelEPE)

anova(modelEPE,modelEPHE)

confint(modelEPE)

vif(modelEPE)


plot(predict(modelEPE),rstudent(modelEPE))
abline(h=c(-2,0,2),lty=2)

qqnorm(resid(modelEPE))
