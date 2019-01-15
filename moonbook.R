# install.packages("tidyverse")
# install.packages('moonBook')
# install.packages('data.table')

library(tidyverse)

mpg %>%
  mutate(total = cty + hwy) %>% 
  mutate(mean = total / 2) %>% 
  arrange(mean) %>% 
  tail() %>% 
  View()

library(moonBook)

acs %>% 
  group_by(Dx, smoking) %>% 
  summarise(HDLC_mean = median(HDLC, na.rm = TRUE),
            LDLC_mean = median(LDLC, na.rm = TRUE),
            TC_mean = median(TC, na.rm = TRUE)) %>% 
  arrange(HDLC_mean) %>% 
  head()

