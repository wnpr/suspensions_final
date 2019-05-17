library(tidyr)
library(dplyr)
library(ggplot2)

disability <- read.csv("disability-17-18.csv", header = T)


p <- disability %>% 
  ggplot()+
  geom_col(stat= "identity",mapping = aes(x=reorder(Primary.Disability, -Suspension.Rate), y=Suspension.Rate), fill="#0072B2")+
  theme_minimal()+
  theme(panel.border = element_blank(), panel.grid.major = element_blank())+
  labs(y = "Percentage")+
  labs(x = "Disability Type")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(axis.text.y = element_text(angle = 45, hjust = 1))+
  labs(title = "Estimated Statewide Suspension Rate for Students with Disabilities By Primary Disability",
       subtitle = "Source: CT Department of Education")+
  theme(plot.title = element_text(face = "bold"))

p







