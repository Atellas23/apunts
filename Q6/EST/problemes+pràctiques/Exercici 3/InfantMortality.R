
library(car)

IM = read.csv2("InfantMortality0.csv")
head(IM)

pairs(IM[,(2:8)], lower.panel=NULL)

IM$LOGINFD = log(IM$INFD)
IM


#par(mfrow=c(2,3))
#for(j in c(2,9)){
#  for(i in (3:5)){plot(IM[,j],IM[,i],xlab=colnames(IM)[i],ylab=colnames(IM)[j])}}
#for(j in c(2,9)){
#  for(i in (6:8)){plot(IM[,j],IM[,i],xlab=colnames(IM)[i],ylab=colnames(IM)[j])}}


#par(mfrow=c(2,3))
#for(j in c(2,9)){
#  for(i in (3:5)){plot(IM[,j],log(IM[,i]),xlab=paste("log",colnames(IM)[i]),ylab=colnames(IM)[j])}}
#for(j in c(2,9)){
#  for(i in (6:8)){plot(IM[,j],log(IM[,i]),xlab=paste("log",colnames(IM)[i]),ylab=colnames(IM)[j])}}
#par(mfrow=c(1,1))


par(mfrow=c(2,6))
for(j in c(2,9)){
  for(i in (3:8)){plot(IM[,j],IM[,i],xlab=colnames(IM)[i],ylab=colnames(IM)[j])}}
par(mfrow=c(1,1))


par(mfrow=c(2,6))
for(j in c(2,9)){
  for(i in (3:8)){plot(IM[,j],log(IM[,i]),xlab=paste("log",colnames(IM)[i]),ylab=colnames(IM)[j])}}
par(mfrow=c(1,1))




# Models per INFD versus les sis x's

modelyx = lm(INFD~PHYS+DENS+AGDS+LIT+HIED+GNP, IM)
summary(modelyx)

plot(predict(modelyx),rstandard(modelyx))
abline(h=c(-2,0,2),lty=2)

qqnorm(rstandard(modelyx))
# Falla hipotesi de linealitat, varianca constant i normalitat.
# El model no ajusta be.


plot(rstandard(modelyx))
abline(h=c(-2,0,2),lty=2)
text(20,4.4,"India")
text(8,2.5,"Xile")


# Mesura del grau d'influencia. 
# Normalment aixo nomes s'estudia un cop has escollit un model bo, que encara
# no es el cas aqui.
plot(cooks.distance(modelyx))
text(20,0.715,"India")
text(26,0.125,"Malaya")
text(27,0.325,"Malta")
text(43,0.1,"Taiwan")
text(46,0.135,"US")


# Mesura de la distancia en l'espai de les X's
# Normalment aixo nomes s'estudia un cop has escollit un model bo, que encara 
# no es el cas aqui.
plot(hatvalues(modelyx))
text(17,0.485,"HongKong")
text(27,0.66,"Malta")
text(39,0.61,"Singapur")
text(46,0.54,"US")




# Model de logINFD versus les sis x's

modellyx = lm(log(INFD)~PHYS+DENS+AGDS+LIT+HIED+GNP, IM)
summary(modellyx)

plot(predict(modellyx),rstandard(modellyx))
abline(h=c(-2,0,2),lty=2)

qqnorm(rstandard(modellyx))
# Aquest model ajusta molt mes be.


plot(rstandard(modellyx))
abline(h=c(-2,0,2),lty=2)


# Analisi del grau d'influencia
plot(cooks.distance(modellyx))
text(27,0.3,"Malta")
text(46,0.655,"US")


# Analisi de la distancia en l'espai de logx's
plot(hatvalues(modellyx))
text(17,0.485,"HongKong")
text(27,0.66,"Malta")
text(39,0.61,"Singapur")
text(46,0.54,"US")



vif(modellyx)
# Lo rellevant mes que el VIF, es saber quines son les variables explicatives
# mes relacionades amb les variables explicatives que tenen VIF mes alt

modelDENS = lm(DENS~PHYS+AGDS+LIT+HIED+GNP, IM)
summary(modelDENS)

modelAGDS = lm(AGDS~PHYS+DENS+LIT+HIED+GNP, IM)
summary(modelAGDS)




# Model de logINFD versus les sis logx's

modellylx = lm(log(INFD)~log(PHYS)+log(DENS)+log(AGDS)+log(LIT)+log(HIED)+log(GNP),IM)
summary(modellylx)

plot(predict(modellylx),rstandard(modellylx))
abline(h=c(-2,0,2),lty=2)
# El model tambe ajusta be, i te una R2 i R2adj mes gran que el model anterior

qqnorm(rstandard(modellylx))


plot(rstandard(modellylx))
abline(h=c(-2,0,2),lty=2)
text(8,2.95,"Xile")


plot(cooks.distance(modellylx))


plot(hatvalues(modellylx))



vif(modellylx)
# La relacio entre variables explicatives s'ha de tenir en compte a l'hora
# d'interpretar el model final. Aqui no es critic, perque el model final no
# tindra totes aquestes variables explicatives.

modelLGPHYS = lm(log(PHYS)~log(DENS)+log(AGDS)+log(LIT)+log(HIED)+log(GNP), IM)
summary(modelLGPHYS)

modelLGLIT = lm(log(LIT)~log(PHYS)+log(DENS)+log(AGDS)+log(HIED)+log(GNP), IM)
summary(modelLGLIT)

modelLGGNP = lm(log(GNP)~log(PHYS)+log(DENS)+log(AGDS)+log(LIT)+log(HIED), IM)
summary(modelLGGNP)

modelLGHIED = lm(log(HIED)~log(PHYS)+log(DENS)+log(AGDS)+log(LIT)+log(GNP), IM)
summary(modelLGHIED)

modelLGDENS = lm(log(DENS)~log(PHYS)+log(AGDS)+log(LIT)+log(HIED)+log(GNP), IM)
summary(modelLGDENS)

modelLGAGDS = lm(log(AGDS)~log(PHYS)+log(DENS)+log(LIT)+log(HIED)+log(GNP), IM)
summary(modelLGDENS)





# Model logINFD versus logGNP

modellylG = lm(log(INFD)~log(GNP),IM)
summary(modellylG)

plot(predict(modellylG),rstandard(modellylG))
abline(h=c(-2,0,2),lty=2)

qqnorm(rstandard(modellylG))


plot(rstandard(modellylG))
abline(h=c(-2,0,2),lty=2)
text(8,2.5,"Xile")
text(43,-2.65,"Taiwan")


# Comprovacio de que tenia sentit treure totes les cinc variables de cop
anova(modellylG,modellylx)


scatterplot(log(INFD)~log(GNP), box=F,smooth=F,IM)

# Tambe s'hauria arribat a aquest model, partint del model per logINFD i
# els logaritmes de les sis x's, i anar treient x's d'una en una en base al
# |tvalue| i els pvalors de les variables.

# Es podria haver comprovat que passava combinant x's i logx's al mateix model,
# i altres opcions.



