# Loading
#setwd("D:/AMC")
setwd("D:/Subintern/WNL")
PKRaw = read.csv("Drug_X_PK.csv")

# There's missing ID so we implemented this code.
UniID = unique(PKRaw$ID)

# Base plot
for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  plot(PKRaw01$TIME, PKRaw01$DV, main = paste0("SUBJID ", UniID[i], sep=" ", PKRaw01$Drug[1], "mg"), ylim=c(0,200), xlab="Time (hour)", ylab="Concentration (ug/L)")
  lines(PKRaw01$TIME, PKRaw01$DV, type="l")
}

# ggplot2 - saves png files in "ggplotfigs" folder.
library(ggplot2)
for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  FINAL = ggplot(PKRaw01, aes(x = TIME, y = DV)) + geom_point() + geom_line() + ggtitle(paste0("SUBJID ", UniID[i], sep=" ", PKRaw01$Drug[1], "mg")) + xlab("Time (hour)") + ylab("Concentration (ug/L)") + expand_limits(y=c(0,200))
  plot(FINAL)
  ggsave(filename = paste0("ggplotfigs/SUBJID", UniID[i], ".png"), FINAL)
}

