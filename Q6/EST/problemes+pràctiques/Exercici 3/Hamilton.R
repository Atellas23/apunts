
library(car)

Hm = read.csv2("Hamilton0.csv")
head(Hm)


plot(Hm$x1,Hm$y)

mx1 = lm(y~x1,Hm)
summary(mx1)

plot(predict(mx1),rstandard(mx1))
abline(h=c(-2,0,2),lty=2)




plot(Hm$x2,Hm$y)

mx2 = lm(y~x2,Hm)
summary(mx2)

plot(predict(mx2),rstandard(mx2))
abline(h=c(-2,0,2),lty=2)




mx1x2 = lm(y~x1+x2,Hm)
summary(mx1x2)



pairs(~y+x1+x2,Hm)
