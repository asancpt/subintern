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

# ggplot2 - this will be used for docx file.
library(ggplot2)

for (i in 1:2){ #length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  FINAL = ggplot(PKRaw01, aes(x = TIME, y = DV)) + geom_point() + geom_line() + ggtitle(paste("SUBJID ", UniID[i], sep = ""))
  plot(FINAL)
  # ggsave(filename = paste0("Figures/SUBJID",UniID[i], ".jpg"), FINAL)
}

# y축 범위를 고정할 것. x축 y축 TIME -> label Time (hour), DV -> Concentration (ug/L)
# Title에 Dose 정보를 삽입 SUBJID ? (~~ mg)