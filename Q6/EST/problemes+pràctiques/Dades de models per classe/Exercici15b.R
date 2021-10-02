
library(car)
library(emmeans)

Prcv = read.csv2("pracovar.csv")
head(Prcv)

Prcv

Prcv$FACTOR = factor(Prcv$FACTOR)



# Cas Y1

scatterplot(Y1~X|FACTOR,smooth=F,regLine=F,Prcv)

scatterplot(Y1~X|FACTOR,smooth=F,Prcv)


# Model no additiu, amb quatre rectes diferents
my1na = lm(Y1~X*FACTOR,Prcv)
summary(my1na)

plot(predict(my1na),rstandard(my1na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my1na))


# Model additiu, amb quatre rectes paral.leles
my1a = lm(Y1~X+FACTOR,Prcv)
summary(my1a)

plot(predict(my1a),rstandard(my1a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my1a))

anova(my1a,my1na)

# Ens quedem amb el model additiu. La presentacio bona es la primera
# de les dues seguents, on les quatre rectes son paral.leles

emmip(my1a,FACTOR~X,CIs=T,at=list(X=c(10,15,20)))

emmip(my1na,FACTOR~X,CIs=T,at=list(X=c(10,15,20)))

# Que el model nomes amb X no es millor es obvi per els valors de t.
# Pero si es vol comparar el model additiu amb FACTOR i X amb el model 
# que nomes te la X:
#
# Model amb rectes iguals
my1X = lm(Y1~X,Prcv)
summary(my1X)

plot(predict(my1X),rstandard(my1X))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my1X))

anova(my1X,my1a)
# Et quedes amb el model que te tant FACTOR com X. Les quatre rectes no son iguals




# Cas Y2

scatterplot(Y2~X|FACTOR,smooth=F,regLine=F,Prcv)

scatterplot(Y2~X|FACTOR,smooth=F,Prcv)


# Model no additiu, amb quatre rectes diferents
my2na = lm(Y2~X*FACTOR,Prcv)
summary(my2na)

plot(predict(my2na),rstandard(my2na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my2na))


# Model additiu, amb quatre rectes paral.leles
my2a = lm(Y2~X+FACTOR,Prcv)
summary(my2a)

plot(predict(my2a),rstandard(my2a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my2a))

anova(my2a,my2na)

# Ens quedem amb el model no additiu. La presentacio bona es la segona
# de les dues seguents, on les quatre rectes no son paral.leles

emmip(my2a,FACTOR~X,CIs=T,at=list(X=c(10,15,20)))

emmip(my2na,FACTOR~X,CIs=T,at=list(X=c(10,15,20)))

# Com que aqui no eliminem les interaccions, ja no te sentit provar el
# model que nomes te la X, ni el model que nomes te FACTOR, encara que
# els seus |t value| siguin petits

# Aqui segurament tindria sentit comprovar si el pendent pels tres ultims
# nivells de FACTOR es igual, pero diferent del pendent per el primer nivell.
#
# Aixo es faria comparant el model my2na amb un model que inclogues la X, 
# la variable FACTOR, i el producte de X per una variable a dos nivells
# que fos 0 per FACTOR=2,3,4, i fos 1 per FACTOR=1.

# Si vulguessis comprovar si la recta pels tres ultims nivells es igual,
# pero diferent que la del quart nivell, compararies el model my2na amb
# el model amb X, una variable que fos 0 per FACTOR=2,3,4 i 1 per FACTOR=1,
# i el producte d'aquestes dues variables.




# Cas Y3

scatterplot(Y3~X|FACTOR,smooth=F,regLine=F,Prcv)

scatterplot(Y3~X|FACTOR,smooth=F,Prcv)


# Model no additiu, amb quatre rectes diferents
my3na = lm(Y3~X*FACTOR,Prcv)
summary(my3na)

plot(predict(my3na),rstandard(my3na))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my3na))


# Model additiu, amb quatre rectes paral.leles
my3a = lm(Y3~X+FACTOR,Prcv)
summary(my3a)

plot(predict(my3a),rstandard(my3a))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my3a))

anova(my3a,my3na)

# Ens quedem amb el model additiu. 


emmip(my3a,FACTOR~X,CIs=T,at=list(X=c(10,15,20)))

# Pero ara te sentit eliminar la variable X del model, perque te un
# |t value| petit i un pvalor de 0.27, i quedar-nos amb el model
# que diu que el pendent de X es 0 i la unica diferencia entre grups es la b0


my3aFACT = lm(Y3~FACTOR,Prcv)
summary(my3aFACT)

plot(predict(my3aFACT),rstandard(my3aFACT))
abline(h=c(-2,0,2),lty=2)


emmip(my3aFACT, ~FACTOR, CIs=T)

emm3aFACT = emmeans(my3aFACT, ~FACTOR)
emm3aFACT

pairs(emm3aFACT)

# Segurament podriem fer un sol grup de FACTOR=2,4, perque tenen mitjanes molt iguals

Prcv$FACTOR2 = Prcv$FACTOR
Prcv$FACTOR2[(31:40)]=2

my3aFACT2 = lm(Y3~FACTOR2,Prcv)
summary(my3aFACT2)

plot(predict(my3aFACT2),rstandard(my3aFACT2))
abline(h=c(-2,0,2),lty=2)
qqnorm(rstandard(my3aFACT2))

anova(my3aFACT2,my3aFACT)
# No es rebutja la hipotesi de que els nivells 2 i 4 comparteixen la
# mateixa mitjana




