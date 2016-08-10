library(ggplot2)
for (i in 1:length(UniID)){
  PKRaw01 = PKRaw[PKRaw$ID == UniID[i], ]
  FINAL = ggplot(PKRaw01, aes(x = TIME, y = DV)) + geom_point() + geom_line() + ggtitle(paste0("SUBJID ", UniID[i], sep=" ", PKRaw01$Drug[1], "mg")) + xlab("Time (hour)") + ylab("Concentration (ug/L)") + expand_limits(y=c(0,200))
  plot(FINAL)
  ggsave(filename = paste0("Figures_SUBJID", UniID[i], ".png"), FINAL)
  }

