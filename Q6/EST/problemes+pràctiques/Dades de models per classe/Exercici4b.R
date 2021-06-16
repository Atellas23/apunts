
library(car)

Pllet = read.csv2("pllet.csv")
head(Pllet)

scatterplot(PROD ~ DIES, boxplot=F, smooth=F, regLine=F, Pllet)





# Pregunta a) Model de PROD nomes amb DIES (1)

modela = lm(PROD ~ DIES, Pllet)
summary(modela)

summary(modela)$sigma^2

summary(modela)$adj.r.squared

help(summary.lm)



# Pregunta a) (2)

scatterplot(PROD ~ DIES, boxplot=F, smooth=F, Pllet)

plot(predict(modela),resid(modela), main=paste("Residual vs fitted"))
abline(h=0,lty=2)
plot(Pllet$DIES,resid(modela), main=paste("Residual vs x"))
abline(h=0,lty=2)

plot(Pllet$DIES,rstandard(modela), main=paste("StandardRes vs x"))
abline(h=c(-2,0,2), lty = 2)


# Banda prediccio valor observat de PROD
dies = 1:275
(prplla = predict(modela,data.frame(DIES=dies),interval="prediction"))
plot(Pllet$DIES, Pllet$PROD)
lines(dies,prplla[,"fit"])
lines(dies,prplla[,"lwr"],lty=2)
lines(dies,prplla[,"upr"],lty=2)


# Banda prediccio valor esperat de PROD
dies = 1:275
(prplla = predict(modela,data.frame(DIES=dies),interval="confidence"))
plot(Pllet$DIES, Pllet$PROD)
lines(dies,prplla[,1])
lines(dies,prplla[,2],lty=2)
lines(dies,prplla[,3],lty=2)



# Pregunta a) (3)

# El Model a no ajusta be. No haurieu de fer cas de cap model ajustat
# si abans no us assegureu de que els residus "estan be".






# Pregunta b) Model PROD amb DIES i DIES^2 (1)

Pllet$DIES2 = Pllet$DIES^2

modelb = lm(PROD ~ DIES + DIES2, data=Pllet)
summary(modelb)

anova(modela,modelb)

(summary(modelb)$sigma^2)

(summary(modelb)$adj.r.squared)

# Tot i que DIES te un |tvalue| petit, no te massa sentit eliminar la variable
# DIES perque no es pot treure DIES2, i no simplificaria el model



# Pregunta b) (2)


# Prediccio valors observats
dies = 1:275
prpllb = predict(modelb,data.frame(DIES=dies,DIES2=dies^2),interval="prediction")
plot(Pllet$DIES, Pllet$PROD)
lines(dies,prpllb[,"fit"])
lines(dies,prpllb[,"lwr"],lty=2)
lines(dies,prpllb[,"upr"],lty=2)


# Prediccio valors esperats
prpllb = predict(modelb,data.frame(DIES=dies,DIES2=dies^2),interval="confidence")
plot(Pllet$DIES, Pllet$PROD)
lines(dies,prpllb[,1])
lines(dies,prpllb[,2],lty=2)
lines(dies,prpllb[,3],lty=2)


# Validacio del model
plot(predict(modelb),resid(modelb), main=paste("Residual vs fitted"))
abline(h=0,lty=2)
plot(Pllet$DIES,resid(modelb), main=paste("Residual vs x"))
abline(h=0,lty=2)

plot(Pllet$DIES,rstandard(modelb), main=paste("StandardRes vs x"))
abline(h=c(-2,0,2), lty = 2)



# Pregunta b) (3)

# Model b no ajusta be. Prohibit fer-lo servir per res.






## Pregunta c) Model logPROD amb DIES i logDIES (1)

Pllet$LGPROD = log(Pllet$PROD)
Pllet$LGDIES = log(Pllet$DIES)

scatterplot(PROD ~ DIES, boxplot=F, smooth=F, regLine=F, Pllet)

scatterplot(LGPROD ~ DIES, boxplot=F, smooth=F, regLine=F, Pllet)

modelc = lm(LGPROD ~ DIES + LGDIES, Pllet)
summary(modelc)

(summary(modelc)$sigma^2)

(summary(modelc)$adj.r.squared)

(summary(modelc)$coef)



# Pregunta c) (2)


# Prediccio valor observat LGPROD
dies = 1:275
prpllc = predict(modelc,data.frame(DIES=dies,LGDIES=log(dies)),interval="prediction")
plot(Pllet$DIES, Pllet$LGPROD)
lines(dies,prpllc[,"fit"])
lines(dies,prpllc[,"lwr"],lty=2)
lines(dies,prpllc[,"upr"],lty=2)


# Prediccio valor observat PROD
plot(Pllet$DIES, Pllet$PROD)
lines(dies,exp(prpllc[,"fit"]))
lines(dies,exp(prpllc[,"lwr"]),lty=2)
lines(dies,exp(prpllc[,"upr"]),lty=2)


# Prediccio valor esperat LGPROD
dies = 1:275
prpllc = predict(modelc,data.frame(DIES=dies,LGDIES=log(dies)),interval="confidence")
plot(Pllet$DIES, Pllet$LGPROD)
lines(dies,prpllc[,"fit"])
lines(dies,prpllc[,"lwr"],lty=2)
lines(dies,prpllc[,"upr"],lty=2)


# Prediccio valor esperat PROD
plot(Pllet$DIES, Pllet$PROD)
lines(dies,exp(prpllc[,"fit"]))
lines(dies,exp(prpllc[,"lwr"]),lty=2)
lines(dies,exp(prpllc[,"upr"]),lty=2)


# Validacio del model c
plot(predict(modelc),resid(modelc), main="Residual vs fitted")
abline(h=0,lty=2)
plot(Pllet$DIES,resid(modelc), main="Residual vs x")
abline(h=0,lty=2)

plot(Pllet$DIES,rstandard(modelc), main="StandardRes vs x")
abline(h=c(-2,0,2), lty = 2)

plot(cooks.distance(modelc), main="Distancia de Cook")
abline(h=0,lty=2)






## EXTRA: I el model logProd en funcio de dies, dies^2 i logdies?

modelextra = lm(LGPROD ~ DIES + DIES2 + LGDIES, Pllet)
summary(modelextra)

anova(modelc,modelextra)

plot(Pllet$DIES,rstudent(modelc), main="StudentRes vs x")
abline(h=c(-2,0,2), lty = 2)

# Aquests model extra no millora el model c. DIES2 es pot eliminar del model

