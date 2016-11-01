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
library(shinydashboard)

ui <- dashboardPage(
 
  header <- dashboardHeader(title = "my test dashboard", dropdownMenu(type =  "messages",
         messageItem(from = "Sales", message = "lekker oefenen")
    )
  ),
  
  
  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Welcome page", tabName = "welcome page",icon = icon("comment")),
      menuItem("Dashoard", tabName = "dashboard", icon = icon("dashboard"), badgeLabel = "new", badgeColor = "green")
    )
    
  ),
  
  
  body <- dashboardBody(
    tabItems(
    tabItem(tabName = "welcome page", h2("informatie en uitleg hier")
            ),
    
    tabItem(tabName = "dashboard", h2("hello")
            )
    # fluidRow(
    #  box(plotOutput(outputId = "bpOperators")), 
    #  box(Output(outputId = "bpTypes"))
    # )
    )
  ),
  
  
  dashboardPage(header, sidebar, body)
  
)


  
server <- function(input, output) {
  # output$bpOperators <- renderPlot({
  #  par(mar=c(10,4,1,1))
  #   barplot(head(sort(table(ac_data$Operator), decreasing = T), n = 10), ylim = c(0,200), col = "gray", las =2, main = 
  #           "Top 10 crashed operators", xlab = "operators", ylab = "number of crashes", sub = "source: airplane crashes since 1908")
  #     })
  # 
  # output$bpTypes <-renderPlot({
  #   par(mar=c(10,4,1,1))
  #   barplot(head(sort(table(ac_data$Type),decreasing = T), n = 10), ylim = c(0,350), col = "lightgray", las = 3, main = 
  #             "top 10 crashed types of airplanes")
  # })
  
}

shinyApp(ui = ui, server = server)

