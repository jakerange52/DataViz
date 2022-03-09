#4
library(ggplot2)

#example

cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = FALSE, method = "loess", formula = y ~ x, color = "#0072B2") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

#using lm, glm, gam
#change colors to #8fe388, #fe8d6d, #7c6bea respectively
#Add title and theme function, font 14, match colors

ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "lm", color = "#8fe388") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")+
  ggtitle("LM Method")+ 
  theme(plot.title=element_text(size=14,color="#8fe388"))

ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "glm", color = "#fe8d6d") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")+
  ggtitle("GLM Method")+ 
  theme(plot.title=element_text(size=14,color="#fe8d6d"))

ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "gam", color = "#7c6bea") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")+
  ggtitle("GAM Method")+
  theme(plot.title=element_text(size=14,color="#7c6bea"))


#5
load("C:/Users/Elrek/Documents/CSC302/HW4/preprint_growth.rda") #please change the path if needed

head(preprint_growth)

#example

preprint_growth %>% filter(archive == "bioRxiv") %>%
  filter(count > 0) -> biorxiv_growth

preprints<-preprint_growth %>% filter(archive %in%
  c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")) %>%filter(count > 0) %>%
  mutate(archive = factor(archive, levels = c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")))

preprints_final <- filter(preprints, date == ymd("2017-01-01"))

#answer
preprint_full<-preprint_growth %>% filter(archive %in% c("bioRxiv","F1000Research")) %>% filter(count>0) %>% filter(date>ymd("2014-02-01")) %>% drop_na()


#example

ggplot(preprints) +
  aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) +
  scale_y_continuous(
    limits = c(0, 600), expand = c(0, 0),
    name = "preprints / month",
    sec.axis = dup_axis( #this part is for the second y axis
      breaks = preprints_final$count, #and we use the counts to position our labels
      labels = c("arXivq-bio", "PeerJPreprints", "bioRxiv"),
      name = NULL)
  ) +
  scale_x_date(name = "year",
               limits = c(min(biorxiv_growth$date), ymd("2017-01-01"))) +
  scale_color_manual(values = c("#0072b2", "#D55E00", "#009e73"),
                     name = NULL) +
  theme(legend.position = "none")
  
  
#answer
ggplot(preprint_full) +
  aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) +
  labs(title="Preprint Counts")+
  scale_x_date(name = "year",
               limits = c(min(preprint_full$date),ymd("2018-01-01")))+ 
  scale_color_manual(values = c("#7c6bea","#fe8d6d"), 
                     name = NULL) +
  theme(legend.position="right")