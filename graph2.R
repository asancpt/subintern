# Loading
setwd("D:/AMC")
PKRaw = read.csv("Drug_X_PK.csv")

# There's missing ID so we implemented this code.
UniID = unique(PKRaw$ID)

# Base plot
for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  plot(PKRaw01$TIME, PKRaw01$DV, main = paste0("SUBJID ", UniID[i], sep=" ", PKRaw01$Drug[1], "mg"), ylim=c(0,200), xlab="Time (hour)", ylab="Concentration (ug/L)")
  lines(PKRaw01$TIME, PKRaw01$DV, type="l")
}

# ggplot2 - this will be used for docx file.
library(ggplot2)

for (i in 1:2){ #length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  FINAL = ggplot(PKRaw01, aes(x = TIME, y = DV)) + geom_point() + geom_line() + ggtitle(paste("SUBJID ", UniID[i], sep = ""))
  plot(FINAL)}
  # ggsave(filename = paste0("Figures/SUBJID",UniID[i], ".jpg"), FINAL)
}

for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  FINAL = ggplot(PKRaw01, aes(x = TIME, y = DV)) + geom_point() + geom_line() + ggtitle(paste("SUBJID ", UniID[i], sep = ""))
  plot(FINAL)
  # ggsave(filename = paste0("Figures/SUBJID",UniID[i], ".jpg"), FINAL)
}

# yì¶? ë²”ìœ„ë¥? ê³ ì •?•  ê²?. xì¶? yì¶? TIME -> label Time (hour), DV -> Concentration (ug/L)
# Title?— Dose ? •ë³´ë?? ?‚½?… SUBJID ? (~~ mg)