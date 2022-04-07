library(tidyr)
library(ggplot2)
library(dplyr)
load("C:/Users/Elrek/Desktop/house_prices.rda")

ggplot(data=house_prices, aes(x=date, y=house_price_index)) + 
  geom_line() + 
  facet_wrap(~state) + 
  scale_x_date(limits = as.Date(c("1980-01-01","2020-01-01")), 
               breaks=as.Date(c("1980-01-01","2000-01-01","2020-01-01")), 
               labels=c("80","00","20"))

house_prices %>% gather(measure, value, -date, -state, -house_price_perc)->house_reshaped

ggplot(data= house_reshaped, aes(x=date, y=value), color=measure) + 
  geom_path() + 
  theme_bw() +
  facet_wrap(~state) + 
  scale_x_date(limits = as.Date(c("1980-01-01","2020-01-01")), 
               breaks=as.Date(c("1980-01-01","2000-01-01","2020-01-01")), 
               labels=c("80","00","20"))
