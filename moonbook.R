install.packages("tidyverse")
library(tidyverse)

mpg %>%
  mutate(total = cty + hwy) %>% 
  mutate(mean = total / 2) %>% 
  arrange(mean) %>% 
  tail() %>% 
  View()

install.packages('moonBook')
install.packages('data.table')

library(moonBook)

acs %>% 
  group_by(Dx, smoking) %>% 
  summarise(HDLC_mean = median(HDLC, na.rm = TRUE),
            LDLC_mean = median(LDLC, na.rm = TRUE),
            TC_mean = median(TC, na.rm = TRUE)) %>% 
  arrange(HDLC_mean) %>% 
  head()
