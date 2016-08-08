# Loading
setwd("D:/Subintern/WNL")
PKRaw = read.csv("Drug_X_PK.csv")

# There's missing ID so we implemented this code.
UniID = unique(PKRaw$ID)

# Base plot
for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  plot(PKRaw01$TIME, PKRaw01$DV, main = paste("SUBJID ", UniID[i], sep = ""))
}

# ggplot2
library(ggplot2)

for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  plot(ggplot(PKRaw01, aes(x = TIME, y = DV)) + geom_point() + geom_line() + ggtitle(paste("SUBJID ", UniID[i], sep = "")))
}

