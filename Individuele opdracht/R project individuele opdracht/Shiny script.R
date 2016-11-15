install.packages("shiny")
install.packages("shinydashboard")

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  
  header <- dashboardHeader(title = "my test dashboard", dropdownMenu(type =  "messages",
                                                                      messageItem(from = "Sales", message = "Final Case study of Data visualisation course"),
                                                                      messageItem(from = "Auteur", message = "created by Robbin Berger, 0817915")
  )
  ),
  
  
  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Welcome page", tabName = "welcome page",icon = icon("comment")
      ),
      
      menuItem("Dashoard", tabName = "dashboard", icon = icon("dashboard"), badgeLabel = "new", badgeColor = "green")
    )
    
  )
)


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "welcome page",
            fluidRow(
              box(title = "Welcome", solidHeader = T, status = "info", "blablablabla", br(), "blablabla", width = 6)
              
            )),
    
    tabItem(tabName = "dashboard",
            fluidRow(
              box(title = "Welcome", solidHeader = T, status = "info", "blablablabla", br(), "blablabla", width = 12)
            ),
            fluidRow(
              box(title = "Plot 1", solidHeader = T, status = "success", sliderInput(inputId = "slider1",
                   label = "kies het aantal operators", min = 0, max = 100, value = 10, ),plotOutput(outputId = "plot1")  
              )
            )
    )
    # fluidRow(
    #  box(plotOutput(outputId = "bpOperators")), 
    #  box(Output(outputId = "bpTypes"))
    # )
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
  
  
  output$plot1 <- renderPlot({
    barplot(head(sort(table(ac_data$Operator), decreasing = T), n = 10), ylim = c(0,200), col = "gray", las =2 ) 
  })
}

shinyApp(ui = ui, server = server)