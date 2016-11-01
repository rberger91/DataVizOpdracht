#What is the highest number ofcrashes by Operator and by Type of aircraft? 


#beginnen met inladen en verkennen van het document 

ac_data <- read.csv("C:\\Users\\Robbin Berger\\Dropbox\\Hogeschool Rotterdam\\Minor Data Science\\Kwartaal 13\\DataViz\\Individuele opdracht\\AC1908.csv")
head(ac_data)
nrow(ac_data)
ncol(ac_data)
str(ac_data)
sum(is.na(ac_data$Operator))
sum(is.na(ac_data$Type))

opers <- levels(ac_data$Operator) #2477 operators
types <- levels(ac_data$Type)  #2447 types of flying objects..

head(sort(table(ac_data$Operator), decreasing = T), n = 10) 
tail(sort(table(ac_data$Operator), decreasing = T), n = 10) 

head(sort(table(ac_data$Type),decreasing = T), n = 10)
tail(sort(table(ac_data$Type), decreasing = T), n = 10)

#wat wil de beste man nou?  operators per type aircraft of beide los? 

help("aggregate")
agr_data <- (aggregate(ac_data$Type ~ ac_data$Operator , data = ac_data, FUN = length))
head(sort(agr_data$`ac_data$Type`, decreasing = T))
      #schiet niks op. bovenstaande is zelfde als de eerder uitgevoerde head 

barplot(head(sort(table(ac_data$Operator), decreasing = T), n = 10), ylim = c(0,200), col = "gray", las =2 )

par(mar=c(10,4,1,1))
barplot(head(sort(table(ac_data$Type),decreasing = T), n = 10), ylim = c(0,350), col = "lightgray", las = 3)



library(shiny)

ui <- fluidpage()
  
server <- function(input, output) {}

shinyApp(ui = ui, server = server)

