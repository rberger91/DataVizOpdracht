#What is the highest number ofcrashes by Operator and by Type of aircraft? 

#dit script is gebruikt als 'oefen' file. de 'shiny script' moet alleen kunnen draaien. 
#beginnen met inladen en verkennen van de dataset

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

#Er zijn teveel operators met teveel type vliegtuigen om hier een nuttige crossvisual van te maken.  

# help("aggregate")
# agr_data <- (aggregate(ac_data$Type ~ ac_data$Operator , data = ac_data, FUN = length))
# head(sort(agr_data$`ac_data$Type`, decreasing = T))
#schiet niks op. bovenstaande is zelfde als de eerder uitgevoerde head 


#verkennen van plot mogelijkheden
barplot(head(sort(table(ac_data$Operator), decreasing = T), n = 10), ylim = c(0,200), col = "gray", las =2 )

par(mar=c(10,4,1,1))
barplot(head(sort(table(ac_data$Type),decreasing = T), n = 10), ylim = c(0,350), col = "lightgray", las = 2, 
        main = "Aantal crashes per type vliegtuig", ylab = "aantal crashes", xlab = "type vliegtuig")


help(par)

edit(head(ac_data$Type))
barplot(head(sort(table(ac_data$Type), decreasing = T), n = 10), ylim = c(0,200), col = "light gray", las =2, main = "Number of crashes per operator", 
        ylab = "Number of crashes", xlab = "operator", sub = "source: https://goo.gl/aOpm1i")

