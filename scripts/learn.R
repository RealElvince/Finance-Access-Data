library(dplyr)

View(iris)

iris_species <- iris %>% select(Species)
View(iris_specis)

# Create a new column
iris_mutate <- iris %>% mutate(new_column = Sepal.Length*Sepal.Width)
View(iris_mutate)

# Rename - change the name of the column
iris_rename <- iris_mutate %>% rename(sepal_dot = new_column)
View(iris_rename)

# Copy dataset
iris_copy <- iris
View(iris_copy)

# select column based on a condition
sepal_length_gt_5 <- iris %>% filter(Sepal.Length > 5)
View(sepal_length_gt_5)

# arrange in ascending, descending negates the column -Petal.Length
iris_arrange <- iris %>% arrange(Petal.Length)
View(iris_arrange)

# group_by a category ,summary

category_species <- iris %>% group_by(Species) %>% summarise(mean_sepal= mean(Sepal.Length))
View(category_species)

# combine several pipes
iris_combined <- iris %>% select(Species,Petal.Width,Petal.Length)%>% 
                  mutate(Petal = Petal.Width*Petal.Length) %>% 
                  arrange(-Petal) %>% 
                  filter(Petal.Length > 1.9) %>% 
                  group_by(Species) %>% 
                  summarise_all(mean)

View(iris_combined)
                

# use summarise_if
iris_summary <- iris %>% group_by(Species) %>% 
                summarise_if(is.numeric,mean)

View(iris_summary)
                  
