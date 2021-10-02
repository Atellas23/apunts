library(car)

DdE22 = read.csv2("reg8h.csv")
head(DdE22)

## Pregunta a) 

plot(DdE22$X1,DdE22$Y1, main="Dades 1")
model1 = lm(DdE22$Y1 ~ DdE22$X1)
summary(model1)


plot(DdE22$X2,DdE22$Y2,main="Dades 2")
model2 = lm(DdE22$Y2 ~ DdE22$X2)
summary(model2)


plot(DdE22$X3,DdE22$Y3,main="Dades 3")
model3 = lm(DdE22$Y3 ~ DdE22$X3)
summary(model3)


plot(DdE22$X4,DdE22$Y4,main="Dades 4")
model4 = lm(DdE22$Y4 ~ DdE22$X4)
summary(model4)


plot(DdE22$X5,DdE22$Y5,main="Dades 5")
model5 = lm(DdE22$Y5 ~ DdE22$X5)
summary(model5)


plot(DdE22$X6,DdE22$Y6,main="Dades 6")
model6 = lm(DdE22$Y6 ~ DdE22$X6)
summary(model6)


plot(DdE22$X7,DdE22$Y7,main="Dades 7")
model7 = lm(DdE22$Y7 ~ DdE22$X7)
summary(model7)


plot(DdE22$X8,DdE22$Y8,main="Dades 8")
model8 = lm(DdE22$Y8 ~ DdE22$X8)
summary(model8)




## Pregunta b) 

# Dades 1

scatterplot(DdE22$X1, DdE22$Y1,smooth=F,box=F,main="Dades 1")

# Validar linealitat, varianca constant i existencia valors estranys
plot(predict(model1),resid(model1), main="Residual vs fitted Dades 1")
abline(h=0,lty=2)
plot(predict(model1),rstandard(model1), main="StandardRes vs fitted Dades 1")
abline(h=c(-3,-2,0,2,3), lty = 2)
plot(predict(model1),rstudent(model1), main="StudentRes vs fitted Dades 1")
abline(h=c(-3,-2,0,2,3), lty = 2)

# Validar normalitat
qqnorm(resid(model1), main="Normal Q-Q plot dels residus. Dades 1")

# Influencia
plot(cooks.distance(model1), main="Distancia de Cook. Dades 1")


# Dades 2

scatterplot(DdE22$X2, DdE22$Y2,smooth=F,box=F,main="Dades 2")

plot(predict(model2),resid(model2), main="Residual vs fitted Dades 2")
abline(h=0,lty=2)
plot(predict(model2),rstudent(model2), main="StudentRes vs fitted Dades 2")
abline(h=c(-3,-2,0,2,3), lty = 2)

qqnorm(resid(model2), main="Normal Q-Q plot dels residus. Dades 2")

plot(cooks.distance(model2), main="Distancia de Cook. Dades 2")


# Dades 3

scatterplot(DdE22$X3, DdE22$Y3,smooth=F,box=F,main="Dades 3")

plot(predict(model3),resid(model3), main="Residual vs fitted Dades 3")
abline(h=0,lty=2)
plot(predict(model3),rstudent(model3), main="StudentRes vs fitted Dades 3")
abline(h=c(-3,-2,0,2,3), lty = 2)

qqnorm(resid(model3), main="Normal Q-Q plot dels residus. Dades 3")

plot(cooks.distance(model3), main="Distancia de Cook. Dades 3")


# Dades 4

scatterplot(DdE22$X4, DdE22$Y4,smooth=F,box=F,main="Dades 4")

plot(predict(model4),resid(model4), main="Residual vs fitted Dades 4")
abline(h=0,lty=2)
plot(predict(model4),rstudent(model4), main="StudentRes vs fitted Dades 4")
abline(h=c(-3,-2,0,2,3), lty = 2)

qqnorm(resid(model4), main="Normal Q-Q plot dels residus. Dades 4")

plot(cooks.distance(model4), main="Distancia de Cook. Dades 4")


# Dades 5

scatterplot(DdE22$X5, DdE22$Y5,smooth=F,box=F,main="Dades 5")

plot(predict(model5),resid(model5), main="Residual vs fitted Dades 5")
abline(h=0,lty=2)
plot(predict(model5),rstudent(model5), main="StudentRes vs fitted Dades 5")
abline(h=c(-3,-2,0,2,3), lty = 2)

qqnorm(resid(model5), main="Normal Q-Q plot dels residus. Dades 5")

plot(cooks.distance(model5), main="Distancia de Cook. Dades 5")


# Dades 6

scatterplot(DdE22$X6, DdE22$Y6,smooth=F,box=F,main="Dades 6")
plot(predict(model6),resid(model6), main="Residual vs fitted Dades 6")
abline(h=0,lty=2)
plot(predict(model6),rstudent(model6), main="StudentRes vs fitted Dades 6")
abline(h=c(-3,-2,0,2,3), lty = 2)

qqnorm(resid(model6), main="Normal Q-Q plot dels residus. Dades 6")

plot(cooks.distance(model6), main="Distancia de Cook. Dades 6")


# Dades 7

scatterplot(DdE22$X7, DdE22$Y7,smooth=F,box=F,main="Dades 7")

plot(predict(model7),resid(model7), main="Residual vs fitted Dades 7")
abline(h=0,lty=2)
plot(predict(model7),rstudent(model7), main="StudentRes vs fitted Dades 7")
abline(h=c(-3,-2,0,2,3), lty = 2)

qqnorm(resid(model7), main="Normal Q-Q plot dels residus. Dades 7")

plot(cooks.distance(model7), main="Distancia de Cook. Dades 7")


# Dades 8

scatterplot(DdE22$X8, DdE22$Y8,smooth=F,box=F,main="Dades 8")

plot(predict(model8),resid(model8), main="Residual vs fitted Dades 8")
abline(h=0,lty=2)
plot(predict(model8),rstudent(model8), main="StudentRes vs fitted Dades 8")
abline(h=c(-3,-2,0,2,3), lty = 2)

qqnorm(resid(model8), main="Normal Q-Q plot dels residus. Dades 8")

plot(cooks.distance(model8), main="Distancia de Cook. Dades 8")
