library(shiny)
library(DT)

shinyUI(fluidPage(
  titlePanel("Poroke v Sloveniji"), 
  sidebarLayout(
    sidebarPanel(
      selectInput("type",label="Kategorija",
                  choice=c("Istospolne poroke", "Število porok po mesecih", "Starost ženina in neveste",
                           "Zakonski stan ženina in neveste leta 1985", "Zakonski stan ženina in neveste leta 2016",
                           "Poroke po slovenskih regijah")
      )
    ),
    mainPanel(plotOutput("box")
    ) 
    
  )))