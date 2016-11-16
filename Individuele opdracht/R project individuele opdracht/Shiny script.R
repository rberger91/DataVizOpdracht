#install.packages("shiny")
#nstall.packages("shinydashboard")

library(shiny)
library(shinydashboard)

#inladen van de data en aanmaken van de gebruikte variabelen.
inputselection1 <- c("operators with most crashes","operators with least crashes")
ac_data <- read.csv(paste(getwd(),"/../AC1908.csv", sep=""))


ui <- dashboardPage(
  
  #het aanmaken van de header titel en het berichten menu. 
  
  header <- dashboardHeader(title = "Plane crash dashboard", titleWidth = 300, dropdownMenu(type =  "messages",
                                                                      messageItem(from = "Sales", message = "Final Case study of Data visualisation course"),
                                                                      messageItem(from = "Auteur", message = "created by Robbin Berger, 0817915")
  )
  ),
  
  
  sidebar <- dashboardSidebar(
    sidebarMenu(
     
      menuItem("Information", tabName = "information", icon = icon("newspaper-o")),
      menuItem("Dashoard", tabName = "dashboard", icon = icon("dashboard"), badgeLabel = "new", badgeColor = "green")
      
    )
    
  ),
  
 
  body <- dashboardBody(
    tabItems(

      #hieroder wordt de ui gemaakt voor de dashboardpagina. De rijen en de boxes, en de elementen die in de boxen getoond moeten worden. 
      tabItem(tabName = "dashboard",
              fluidRow(
                box(title = "Explanation", solidHeader = T, status = "info", "On this page you can see for boxes. the boxes on the left are the visualisations of the available data.",
                    br(), "The boxes on the right provides the user the posibility to change the plots with the given controls", width = 12)
              ),
              fluidRow(
                box(title = "Plot 1", solidHeader = T, status = "success",plotOutput(outputId = "plot1"                                      )  
                , collapsible = T, collapsed = F),
                box(title = "plot 1 controls", solidHeader = T, status = "success", sliderInput(inputId = "slider1",
                                          label = "Choose the number of operators", min = 5, max = 15, value = 10 ),
                                          selectInput(inputId = "select1", label = "choose dimension", choices = inputselection),
                                          collapsible = T, collapsed = F
                                          )
                )#,
              # fluidRow(
              #   box(plotOutput("plot2"), title = "plot 2", solidHeader = T, status = "success", collapsed = T, collapsible = T),
              #   box(title = "plot 2 controls", solidHeader = T, status = "success", collapsible = T, collapsed = T)
              # )
      ),
      tabItem(tabName = "information",
              fluidRow(
                box(title = "hello, how are you?" , solidHeader = T, status = "info", "Dit is het product voor de eindopdracht van de cursus datavisualisatie van de minor DataScience aan de Hogeschool Rotterdam.",
                    br(), "rechtsboven vind u informatie over de auteur", br(), "Links kunt u op menu item Dashboard klikken om de visualitatie te zien")
              ))
    )
  ),
  
  
  dashboardPage(header, sidebar, body)
    
)

server <- function(input, output) {

    output$plot1 <- renderPlot({
      if (input$select1 == inputselection1[1]) {
      par(mar=c(10,4,1,1))
      barplot(head(sort(table(ac_data$Operator), decreasing = T), n = input$slider1), ylim = c(0,200), col = "light gray", las =2, main = "Number of crashes per operator", 
              ylab = "Number of crashes")
      mtext("operator", side = 1, line = 8)
      mtext("source: https://goo.gl/aOpm1i", side =1 , line = 9)
      

  } else { 
      barplot(tail(sort(table(ac_data$Operator), decreasing = T), n = input$slider1), ylim = c(0,5), col = "light gray", las =2, main = "Number of crashes per operator", 
              ylab = "Number of crashes")
    mtext("operator", side = 1, line = 8)
    mtext("source: https://goo.gl/aOpm1i", side =1 , line = 9)

    }
  })
    
    
  }

shinyApp(ui = ui, server = server)