
library(dplyr)
library(ggplot2)
library(ggpbur)

setwd("/Users/elvo/Desktop/Projects/R/learn_r")


finance_access <- read.csv("finance.csv")

View(finance_access)

# Select gender_of_respondent, age ,numeracy

finance_select <- finance_access %>% 
                  select(gender_of_respondent, age, numeracy)

View(finance_select)

# save new finance
write.csv(finance_select,"finance_gender_respondent.csv")

# View the columns / variables of the finance.csv data
summary(finance_access)

# convert categorical variables to factor

finance_access_factor <- finance_access %>% 
                        mutate_if(is.character,as.factor)

summary(finance_access_factor)

# visualize the data
# use geom_bar 
gender_financial_literacy = ggplot(finance_access_factor,aes(x=gender_of_respondent,fill=fin_literacy))+
    geom_bar(stat="count",position=position_dodge2())+
    xlab("Gender of Respondent")+
    ylab("Number of each Category")+
    ggtitle("Gender versus financial literacy levels.")

# view in new window
dev.new()
gender_financial_literacy

# save the visualization directly in the folder
# save png
ggsave(
  filename = "gender_financial_literacy.png",
  plot = gender_financial_literacy,
  width = 8,
  height = 6,
  units = 'in',
  dpi = 300
)

# save as pdf
ggsave(
  filename = "gender_financial_literacy.pdf",
  plot = gender_financial_literacy,
  width = 8,
  height = 6,
  units = "in"
)

getwd()
