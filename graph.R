# 불러오기

setwd("D:/Subintern/WNL")
PKRaw = read.csv("Drug_X_PK.csv")

# There's missing ID so we implemented this code.
UniID = unique(PKRaw$ID)

# 1st 대상자에 대한 그림
for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  plot(PKRaw01$TIME, PKRaw01$DV, main = paste("SUBJID ", UniID[i], sep = ""))
}

# ggplot
library(ggplot2)

for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  plot(ggplot(PKRaw01, aes(x = TIME, y = DV)) + geom_point() + geom_line() + ggtitle(paste("SUBJID ", UniID[i], sep = "")))
}

