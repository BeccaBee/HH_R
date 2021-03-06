library(ggplot2)
library(lattice)
data<-read.csv2("~/Research/Data/Testdata.csv", header=TRUE)
View(data)

data$Var2<-as.numeric(data$Var2)
data$Var1<-as.numeric(data$Var1)
data$Var3<-as.numeric(data$Var3)
data$DOC<-as.numeric(data$DOC)
data$DOC2<-as.numeric(data$DOC2)

##latticeplot##
plot<-xyplot(Var1 ~ Var2, data=data)
plot

pp<-xyplot(Var1~Var3, data=data)
pp


##ggplot##
p1<-ggplot(data, aes(x=Var1, y=Var2)) + geom_smooth(method='lm')+
geom_area(aes(fill='Range')) 

p1 + ggtitle("Soil Organic Carbon Distribution") +
     xlab("Fine Litter Trait Values (pH, k*,HWE C)") +
     ylab("TOC in upper vs. lower layers of soil") +
     theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank()) 

##  scale_x_discrete(breaks=c("1", "10"), labels=c("Low", "High")) +
##  scale_y_discrete(breaks=c("1", "10"), labels=C("0to1", "1to0"))


p2<-ggplot(data, aes(x=Var1, y=Var3)) + geom_smooth(method= 'lm') +
geom_area(aes(fill='Range')) 

p2 +  ggtitle("Soil Organic Carbon Distribution") +
  xlab("Fine Litter Trait Values (pH, k*, HWE C)") +
  ylab("TOC in Mineral-Associated vs. Sand+Aggregate
       Soil Fractions") +
     theme (axis.text.x= element_blank (), 
            axis.text.y = element_blank(),
            axis.ticks = element_blank())

p3<-ggplot(data, aes(x=Var1, y=DOC)) + geom_line(method= 'lm') +
  geom_area(aes(fill='Range')) 

p3 +  ggtitle("Soil Organic Carbon Distribution") +
  xlab("Fine Litter Trait Values (pH, k*, HWE C)") +
  ylab("DOC fraction") +
  ylim(0,1) +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank())

p4<-ggplot(data, aes(x=Var1, y=DOC2)) + geom_line(method= 'lm') +
  geom_area(aes(fill='Range')) 

p4 +  ggtitle("Soil Organic Carbon Distribution") +
  xlab("Fine Litter %Lignin & Cellulose") +
  ylab("DOC fraction") +
  ylim(0,1) +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank())

p5<-ggplot(data, aes(x=Var1, y=Var2)) + geom_line(method= 'lm') +
  geom_area(aes(fill='Range')) 

p5 +  ggtitle("Soil Organic Carbon Distribution") +
  xlab("Fine Litter Traits (C:N Ratio, %Lignin & Cellulose)") +
  ylab("TOC in Mineral-Associated vs. Sand+Aggregate
       Soil Fractions") +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank())

p6<-ggplot(data, aes(x=Var1, y=Var2)) + geom_line(method= 'lm') +
  geom_area(aes(fill='Range')) 

p6 +  ggtitle("Soil Organic Carbon Distribution") +
  xlab("Fine Litter Traits (C:N Ratio, %Lignin & Cellulose)") +
  ylab("TOC in upper vs. lower layers of soil")  +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank())

##UniFrac##
library(GUniFrac)

##Microbial communities and Growth Efficiency##
p7<-ggplot(data, aes(x=VarLH, y=GE)) + geom_line(method='lm', aes(color=POP)) 
  
p7 + ggtitle("Microbial Community Growth Efficiency") +
  xlab("Time") +
  ylab("Community-level growth efficiency")  +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank())

p8<-ggplot(data, aes(x=TraitsLH, y=DISTlh)) + geom_line(method='lm')

p8 + ggtitle("Microbial Community Dissimilarity") +
  xlab("Time") +
  ylab("Community Dissimilarity")  +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank())

p8a<-ggplot(data, aes(x=TraitsLH, y=DISThl)) + geom_line(method='lm')

p8a + ggtitle("Microbial Community Dissimilarity") +
  xlab("Time") +
  ylab("Community Dissimilarity")  +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank()) 

p9<-ggplot(data, aes(x=DISTlh, y=GE)) + geom_line (method='lm', aes(color=POP))
p9 + ggtitle("Microbial Community Growth Efficiency as a Function of Dissimilarity") +
  xlab("Dissimilarity Index") +
  ylab("Community Growth Efficiency Index")  +
  theme (axis.text.x= element_blank (), 
         axis.text.y = element_blank(),
         axis.ticks = element_blank())

##Growth Efficiency, Dissimilarity, and SOC Distribution##




