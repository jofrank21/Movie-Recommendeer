#Movie Recommendation Algorithm

ratings <- read.table(text = gsub("::", "\t", readLines("edx.rds")), col.names = c("userID", "movieID", "rating", "timestamp"))

edx <- readRDS("edx.rds")
validation <- readRDS("validation.rds")

head(edx)
dim(validation)


### Report & Script ###

'The following libraries have been used in the process of this project:'

library(tidyverse)
library(caret)
library(stringr)

#The required MovieLens data has been downloaded according to the instructions provided for users with RStudio 3.6. 
#Afterwards the data has been loaded into R. Since the files have been provided as two clean .rds files, no further
#data cleaning has been required.

#Loading the training set
edx <- readRDS("edx.rds")

#Loading the testing set
validation <- readRDS("validation.rds")

#Exploring the data
head(edx)
class(edx)
names(edx)
dim(edx)

'The training set contains a data frame with 9000055 rows and 6 columns. It provides us with userID, movieID,
rating, timestamp, title and genres.'

#Unique users
length(unique(edx[,1]))

#Unique movie title
length(unique(edx[,2]))

#Rating dimensions
length(unique(edx[,3]))
min(edx[,3])
max(edx[,3])

'The training set contains the ratings from 69878 unique users, who have rated a total of 10677 different
movies. Ratings range from 0.5 to 5 in 0.5 intervalls.'

#Number of Genres
sum(grepl("|", edx[,6]))

'Each movie has at least two genres attributed to it.'
length(edx[,2])

### RMSE returned by algorithm ###

grepl("|", edx[1,6])
str_count(edx[2,6], "|")

edx[2,]
###Further Information###

edx %>% group_by(rating) %>% summarize(count = n()) %>% top_n(5) %>%
  arrange(desc(count))  

edx %>%
  group_by(rating) %>%
  summarize(count = n()) %>%
  ggplot(aes(x = rating, y = count)) +
  geom_line()

head(edx)

(length(edx[,1])) / length(unique(edx[,1]))





