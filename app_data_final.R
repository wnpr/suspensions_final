library(dplyr)
library(tidyverse)

#setwd()

##import be careful of NAs! 

df <- read.csv("tuition_to_other_schools.csv", header= T, stringsAsFactors = F, na.strings=c("",".","NA", "N/A"), check.names = F)

#tidy data from wide to long using gather()
df_long <- gather(df, Year, Total, "2006 07":"2016 17")

#create values for the districts drop down menu 
districts <- sort(unique(df_long$District))

#save r data file
save(df_long, districts, file = "appdatafile.rdata")
