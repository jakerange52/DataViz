#create a dataframe with the names, number of sales, and states
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
#aggregate data and sort
aggregate(df1$Sales, by=list(df1$State), FUN=sum)
#import dplyr
library(dplyr)
#use dplyr to group by state and show sales in those states
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

#read worldcup from g drive
df=read.csv("G:/My Drive/CSC302/Copy of WorldCupMatches.csv")
#num of cols & rows
ncol(df)
nrow(df)
#summary of DF
summary(df)
#Unique Locations:
n_distinct(df$Stadium)
#Average attendance
summarise(df, AvgAtt = mean(Attendance, na.rm = T))
#Total number of goals scored
sum(df$Home.Team.Goals, df$Away.Team.Goals)
#Avg attendees per year
df %>%
  group_by(Year) %>%
  summarise(AvgAtt = mean(Attendance, na.rm=T))

#read metabolites from g drive
df=read.csv("G:/My Drive/CSC302/Copy of metabolite.csv")
#find num of alzheimers patients
table(df$Label)
#Find missing values in every column
sapply(df, function(x) sum(is.na(x)))
#Remove rows with missing data for dopamine
df2=df[!is.na(df$Dopamine),]
#replace missing values in c4-OH-Pro with median values
df2$c4.OH.Pro[is.na(df2$c4.OH.Pro)]<-median(df2$c4.OH.Pro,na.rm=TRUE)