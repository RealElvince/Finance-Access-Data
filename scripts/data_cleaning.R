# libraries
library(dplyr)

getwd()

setwd("/Users/elvo/Desktop/Projects/R/learn_r")

# data cleaning
View(finance_access_factor)
summary(finance_access_factor)

# check the dataset for NAs
levels(finance_access_factor$Marital_status)

finance_access_factor <- finance_access_factor %>% mutate(
  Marital_status=
    case_when(
      Marital_status == "Widowed"~"Widowed",
      Marital_status == "Single"~"Single",
      Marital_status == "Married/Living with partner"~"Married",
      Marital_status == "Don’t know/Refused to answer"~"NA",
      Marital_status == "Divorced/Separated"~"Divorced"
      )
  ) %>% mutate_if(is.character,as.factor)

# Religiongroup other/no answer with other

finance_access_factor <- finance_access_factor %>% mutate(
  religiongp=
    case_when(
      religiongp == "NA"~"Christianity",
      religiongp == "Islam"~"Islam",
      religiongp == "other/No Answer"~"Other"
    )
) %>% mutate_if(is.character,as.factor)

levels(finance_access_factor$religiongp)
summary(finance_access_factor)

View(finance_access)