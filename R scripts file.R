# loading packages
library(readxl)
library(dplyr)
library(ggplot2)

# loading dataset
task_A <- read_xlsx('C:/Users/Sigma/Desktop/fall/task A.xlsx')
head(task_A)

# convert month to date
library(lubridate)
task_A$`Month ID` <- parse_date_time(task_A$`Month ID`, "%Y%m")

## Setting the working theme
## Question 1
theme_set(theme_bw())
task_A %>% ggplot(aes(`Month ID`, Defects))+
  geom_line()+
  labs(x = 'Date', 'Number of Defects',
       title = 'Number of Defects Over Time')

## Question 2
task_A %>% ggplot(aes(`Month ID`, Opportunities))+
  geom_line()+
  labs(x = 'Date', 'Number of Opportunities',
       title = 'Number of Opportunities Over Time')


## QUestion 3
colors <- c("Defect Rates" = "orange", "Mean Rate" = "tomato", 
            "2 Sigma Limit" = "yellow", "3 Sigma Limit" = "blue")

task_A %>% ggplot(aes(x = `Month ID`))+
  geom_line(aes(y = `Defect Rates`, color = "Defect Rates"), size = 1.2)+
  geom_line(aes(y = `Mean Rate`, color = "Mean Rate"), size = 1.2)+
  geom_line(aes(y = `2 Sigma Limit`,  color = "2 Sigma Limit"), size = 1.2)+
  geom_line(aes(y = `3 Sigma Limit`, color = "3 Sigma Limit"), size =1.2)+
  scale_color_manual(values = colors,
                     name = "Group")+
  labs(color = 'Legend', x = 'Date', y = 'count',
       title = 'Defect Rates with the Mean Rate and Limits over time
')


## QUestion 4
colors1 <- c("Defect Rates" = "orange", "Mean Rate" = "tomato", 
            "2 Sigma Limit" = "yellow", "3 Sigma Limit" = "blue",
            "Opportunities" = 'green', "Defects" = "green"
            )
task_A %>% ggplot(aes(x = `Month ID`))+
  geom_line(aes(y = `Defect Rates`, color = "Defect Rates"), size = 1.2)+
  geom_line(aes(y = `Mean Rate`, color = "Mean Rate"), size = 1.2)+
  geom_line(aes(y = `2 Sigma Limit`,  color = "2 Sigma Limit"), size = 1.2)+
  geom_line(aes(y = `3 Sigma Limit`, color = "3 Sigma Limit"), size =1.2)+
  geom_line(aes(y = Opportunities, color = "Opportunities"), size =1.2)+
  geom_line(aes(y = Defects, color = "Defects"), size =1.2)+
  scale_color_manual(values = colors1,
                     name = "Group")+
  labs(color = 'Legend', x = 'Date', y = 'Defect Rates')

## QUestion 5
task_A %>% ggplot(aes(x = `Month ID`))+
  geom_line(aes(y = `Defect Rates`, color = "Defect Rates"), size = 1.2)+
  geom_line(aes(y = `Mean Rate`, color = "Mean Rate"), size = 1.2)+
  geom_line(aes(y = `2 Sigma Limit`,  color = "2 Sigma Limit"), size = 1.2)+
  geom_line(aes(y = `3 Sigma Limit`, color = "3 Sigma Limit"), size =1.2)+
  scale_color_manual(values = colors,
                     name = "Group")+
  labs(color = 'Legend', x = 'Date', y = 'Defect Rates')
