#install.packages("shiny")
#nstall.packages("shinydashboard")

library(shiny)
library(shinydashboard)


inputselection <- c("head","tail")

ui <- dashboardPage(
  
  header <- dashboardHeader(title = "Plane crash dashboard", dropdownMenu(type =  "messages",
                                                                      messageItem(from = "Sales", message = "Final Case study of Data visualisation course"),
                                                                      messageItem(from = "Auteur", message = "created by Robbin Berger, 0817915")
  )
  ),
  
  
  sidebar <- dashboardSidebar(
    sidebarMenu(
      # menuItem("Home page", tabName = "welcome page",icon = icon("comment")
      # ),
      # 
      menuItem("Dashoard", tabName = "dashboard", icon = icon("dashboard"), badgeLabel = "new", badgeColor = "green")
    )
    
  ),
  
  
  
  body <- dashboardBody(
    tabItems(
      # tabItem(tabName = "Home page",
      #         fluidRow(
      #           box(title = "Welcome", solidHeader = T, status = "info", "blablablabla", br(), "blablabla", width = 6)
      #           
      #         )),
      
      tabItem(tabName = "dashboard",
              fluidRow(
                box(title = "Explanation", solidHeader = T, status = "info", "On this page you can see for boxes. the boxes on the left are the visualisations of the available data.",
                    br(), "The boxes on the right provides the user the posibility to change the plots with the given controls", width = 12)
              ),
              fluidRow(
                box(title = "Plot 1", solidHeader = T, status = "success",plotOutput(outputId = "plot1"                                      )  
                ),
                box(title = "plot 1 controls", solidHeader = T, status = "success", sliderInput(inputId = "slider1",
                                          label = "Choose the number of operators", min = 5, max = 15, value = 10 ),
                                          br(), selectInput(inputId = "select1", label = "choose dimension", choices = inputselection))
                ),
              fluidRow(
                box(plotOutput("plot2"), title = "plot 2", solidHeader = T, status = "success"),
                box(title = "plot 2 controls", solidHeader = T, status = "success")
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
    barplot(input$select1(sort(table(ac_data$Operator), decreasing = T), n = input$slider1), ylim = c(0,200), col = "light gray", las =2, main = "Number of crashes per aircraft type", 
            ylab = "Number of crashes", xlab = "type of aircraft", sub = "source: www.bron.nl")
    #hist(rnorm(1000), main = "hello world")
    #hier moet nog iets leuks gedaan worden met de par() om de labels goed leesbaar te maken
  })
}

shinyApp(ui = ui, server = server)