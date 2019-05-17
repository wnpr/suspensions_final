library(tidyr)
library(dplyr)
library(ggplot2)

disability <- read.csv("disability-17-18.csv", header = T)


chart_1 <- disability %>% 
  ggplot()+
  geom_col(stat= "identity",mapping = aes(x=reorder(Primary.Disability, -Suspension.Rate), y=Suspension.Rate), fill="purple")+
  labs(y = "Percentage")+
  labs(x = "Disability Type")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme(axis.text.y = element_text(angle = 45, hjust = 1))+
  labs(title = "Estimated Statewide Suspension Rate for Students with Disabilities By Primary Disability",
       subtitle = "Source: CT Department of Education")

chart_1