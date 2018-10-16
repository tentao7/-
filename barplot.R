
#bigcity
#barplot , beside=T 

install.packages('boot')
library(boot)
data(bigcity)
bct=bigcity
index = seq(1:49)
bct$seq = index 

head(bct)
colnames(bct)
str(bct)

bct

barplot(rbind(bct$y20[1:49],c(bct$y30[1:49])),
        beside = TRUE,names.arg = bct$seq )

