library(dplyr)
setwd("/Users/elvo/Desktop/Projects/R/learn_r")


# mobile count
mobile_count <- finance_access %>% 
                group_by(mobile) %>% 
                summarise(count = n())

View(mobile_count)
