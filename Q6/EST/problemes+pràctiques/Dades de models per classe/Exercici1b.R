library(car)

Col = read.csv2("col.csv")
head(Col)

#scatterplot(C~P,smooth=F,box=F,regLine=F, Col)
#scatterplot(C~H,smooth=F,box=F,regLine=F, Col)
#sp(C~E,smooth=F,box=F,regLine=F, Col)

pairs(~C+P+H+E, lower.panel=NULL,Col)




# Pregunta a)

modelPHE = lm(C ~ P + H + E,Col)
summary(modelPHE)

# "A ma"
(X = as.matrix(cbind(1,Col$P,Col$H,Col$E)))
(Y = as.matrix(Col$C))
(n = dim(X)[1])
(p = dim(X)[2])
(XtX = t(X)%*%X)
(XtY = t(X)%*%Y)
(XtXinv = solve(XtX))
(b=XtXinv%*%XtY)




## Pregunta b)

pred = predict(modelPHE)
res = resid(modelPHE)
plot(pred,res)
abline(h=0, lt=2)
# Tambe es pot fer plot(modelPHE$fitted.values,modelPHE$residuals)

# A ma
ypred = X%*%b
ress = Y - ypred
plot(ypred,ress)
abline(h=0,lty=2)




## Pregunta c)

summary(modelPHE)


# Pregunta c1) .Comparacio amb model nul. Treiem tots els coeficients a l'hora.
# Les transparencies de teoria en diu test "omnibus"

model0 = lm(C~1,Col)
summary(model0)
(mean(Col$C))

(anova(model0,modelPHE))


# A ma
(sqr = sum(ress^2))
(gllr = n - p)
(msqr = sqr/gllr)
(sqt = sum((Y-mean(Y))^2))
(sqm = sum((ypred - mean(Y))^2))
(gllq = p-1)
(Ftest = ((sqt-sqr)/gllq)/msqr)
(pvalor = pf(Ftest,gllq,gllr,lower.tail=F))



# Ampliacio de c1). Podeu comparar el model sencer, amb totes
# les variables, amb qualsevol model aniuat. 
# Per exemple podeu comparar el model amb les tres variables, amb el model 
# que nomeste el Pes, per decidir si podeu treure de cop Edat i Alcada,
# de la seguent manera:

modelP = lm(C~P,Col)
anova(modelP,modelPHE)

# Per comparar el model amb P,E i H i el model sense H, i per tant nomes amb
# P i E podeu fer servir la seva t
# o tambe ho podeu fer a traves d'aquest Ftest de l'anova comparant el
# model amb P, H i E amb el model amb nomes P i E, (sense H). Es equivalent

summary(modelPHE)

modelPE = lm(C~P+E,Col)
anova(modelPE,modelPHE)
# Pots comprovar que F=49.77 = t^2 = 7.055^2



# Pregunta c2). Comparacio coeficients individuals

summary(modelPHE)
Anova(modelPHE)
# Fvalue = tvalue^2, i F(1,q) = tq^2
# Feu servir sempre anova(model0,model1) per comparar dos models aniuats.
# Per un sol model, feu servir sempre Anova(model).

# A ma
(Varb = XtXinv*msqr)
#O tambe vcov(modelPHE)
#Tambe es te que XtXinv= summary(model)$cov.unscaled
(sb = sqrt(diag(Varb)))
cbind.data.frame(b = b, Stdb = sb, t = b/sb, pvalue = 2*pt(-abs(b/sb),gllr))




## Pregunta d)

confint(modelPHE)

# A ma
tc = qt(0.975,gllr)
(iconfb = cbind.data.frame(b,linf=b-tc*sb,lsup=b+tc*sb))




## Pregunta e) Persona P=65, H=150, E=15


# e1) Interval valor previst a x0

x0 = c(1,65,150,15)
(predict(modelPHE, data.frame(P=65, H=150, E=15, row.names="x0"), interval="prediction", level=.95))

# A ma
(Predx0 = sum(x0*b))
# Tambe es pot fer (Predx0 = x0%*%b)(
(stdPredx0PI = sqrt((1+t(x0)%*%XtXinv%*%x0)*msqr))
(intvpred = c("Pred"=Predx0,"linfpred"=Predx0 - tc*stdPredx0PI, "lsuppred"=Predx0 + tc*stdPredx0PI))


## e2) Interval valor esperat a x0

(predict(modelPHE, data.frame(P=65, H=150, E=15, row.names="x0"), interval="confidence", level=.95))

# A ma
(Predx0 = sum(x0*b))
(stdPredx0CI = sqrt((t(x0)%*%XtXinv%*%x0)*msqr))
(intvesper = c("Pred"=Predx0,"linfpred"=Predx0 - tc*stdPredx0CI, "lsuppred"=Predx0 + tc*stdPredx0CI))


## e3) Prova H0:E(Col|65,150,15) = 190

lht(modelPHE,c(1,65,150,15),190)

# A ma
(tstat = (Predx0 - 190)/stdPredx0CI)
(pvalor = 2*pt(-abs(tstat),gllr))
# Fet amb la distribucio F
(Fstat = tstat^2)
(pvalor = pf(Fstat,1,gllr,lower.tail = F))

# Tambe es pot comprovar que 190 no es dins de l'interval de confianca per
# E(y|x0), i per aixo es rebutja la H0.