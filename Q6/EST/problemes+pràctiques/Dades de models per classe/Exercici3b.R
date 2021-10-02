
library(car)

cnnh3 = c(2,5,10,20,50,100)
lectura = c(85,107,124,140,161,179)
lgcnnh3 = log(cnnh3)

scatterplot(cnnh3,lectura,boxplot=F,smooth=F,regLine=F)

scatterplot(lgcnnh3,lectura,boxplot=F,smooth=F,regLine=F)


# Pregunta a)




# Pregunta b)

model = lm(lectura ~ lgcnnh3)
summary(model)

model0 = lm(lectura~1)
summary(model0)

anova(model0,model)



# Pregunta c)

plot(predict(model), resid(model))
abline(h=0,lty=2)

plot(predict(model), rstandard(model))
abline(h=c(-2,0,2), lty=2)

qqnorm(rstandard(model))

plot(cooks.distance(model))




# Pregunta d)

(cnnh30 = exp((167 - coef(model)[1])/coef(model)[2]))

# Solucio alternativa
# cal = function(x){predict(model,data.frame(lgcnnh3=log(x))) - 167}
# (cnnh30 = uniroot(cal,c(50,80))$root)



# Pregunta e)

(predict(model,data.frame(lgcnnh3=log(60)),interval="prediction"))

help(predict.lm)

#L'interval inclou 167, i per tant es possible



# Pregunta f)


piup = function(x){predict(model,data.frame(lgcnnh3=log(x)),interval="prediction")[,"upr"] - 167}

pilow = function(x){predict(model,data.frame(lgcnnh3=log(x)),interval="prediction")[,"lwr"] - 167}

(cnnh3low = uniroot(piup,c(30,90))$root)

(cnnh3up = uniroot(pilow,c(30,90))$root)


# Presentacio grafica

(pilect = predict(model,data.frame(lgcnnh3=c(log(1:100))),interval="prediction"))

plot(cnnh3,lectura,main="lectura=167, cnnh3=61.91 (57.19, 67.12)")
lines(1:100,pilect[,1])
lines(1:100,pilect[,2],lty=2)
lines(1:100,pilect[,3],lty=2)
abline(h=167,col="red")
abline(v=c(cnnh3low,cnnh30,cnnh3up), col = "blue")

#plot(cnnh3,lectura,xlim=c(50,75),ylim=c(160,175), main="lectura=167, cnnh3=61.91 (57.19, 67.12)")
#lines(1:100,pilect[,1])
#lines(1:100,pilect[,2], lty=2)
#lines(1:100,pilect[,3], lty=2)
#abline(h=167, col="red")
#abline(v=c(cnnh3low,cnnh30,cnnh3up), col ="blue")


