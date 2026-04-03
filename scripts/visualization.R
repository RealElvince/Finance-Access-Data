# libraries
library(dplyr)
library(tidyr)
library(ggplot2)


getwd()

setwd("/Users/elvo/Desktop/Projects/R/learn_r")

finance_factor <- finance_access %>% mutate_if(is.character,as.factor)
summary(finance_factor)

finance_factor <- finance_factor %>% drop_na(finance_factor)

View(finance_factor)

# Visualization
# use of Barchart

gender_mobile_count <- finance_factor %>% group_by(gender_of_household_head,mobile) %>% 
                        summarise(count = n()) %>% 
                        mutate(percent1 = (count/sum(count))*100)

View(gender_mobile_count)

gender_mobile_graph <- ggplot(gender_mobile_count,aes(x = gender_of_household_head, y = percent1, fill = mobile))+
                      geom_bar(stat = "identity",position = position_dodge2())
dev.new()
gender_mobile_graph