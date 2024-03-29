setwd("C:/Users/alexb/apunts/Q6/EST/problemes+pr�ctiques")
dd <- read.csv2("Enquesta.csv")
dd
head(dd)
dim(dd)
dd$Edat
dd$MO
dd$MO <- factor(dd$MO, labels = c("No","S�"))
barplot(summary(dd$MO), main = "Reciclen vs. No reciclen (org�nica)")
dd$PC <- factor(dd$PC, labels = c("No","S�"))
barplot(summary(dd$PC), main = "Reciclen vs. No reciclen (paper i cartr�)")
dd$Envas <- factor(dd$Envas, labels = c("No","S�"))
barplot(summary(dd$Envas), main = "Reciclen vs. No reciclen (envasos)")
dd$Vidre <- factor(dd$Vidre, labels = c("No","S�"))
barplot(summary(dd$Vidre), main = "Reciclen vs. No reciclen (vidre)")
dd$Sexe <- factor(dd$Sexe, labels = c("F","M"))
barplot(summary(dd$Sexe), main = "Pres�ncia de cada sexe en l'enquesta")
dd$Aspecte <- factor(dd$Aspecte, labels = c("E","F","M","T"))
barplot(summary(dd$Aspecte), main = "Excusa donada per no reciclar")
dd$IM <- dd$D2/dd$D4
# plot(x=1:500,y=sort(dd$IM))

dd$BMI <- dd$Pes/(dd$H/100)^2
dd$CBMI <- cut(dd$BMI, c(0,19,27,100), labels = c("1-baix","2-mitj�","3-alt"))

library(tables)
library(RcmdrMisc)



tabular(mean*(Sexe+1)~H*(CBMI+1), dd)
tabular(var*(Sexe+1)~H*(CBMI+1), dd)

interaction.plot(dd$CBMI, dd$Sexe, dd$H)

plotMeans(dd$H, dd$CBMI, dd$Sexe, error.bars = "sd")
