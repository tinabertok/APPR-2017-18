library(shiny)
library(datasets)

shinyServer(function(input, output) {
  output$box <- renderPlot({
    if(input$type == "Istospolne poroke"){
      print(graf1)}
    else if (input$type == "Število porok po mesecih"){
      print(graf2)}
    else if (input$type == "Starost ženina in neveste"){
      print(graf3)}
    else if (input$type == "Zakonski stan ženina in neveste leta 1985"){
      print(graf4)}
    else if (input$type == "Zakonski stan ženina in neveste leta 2016"){
      print(graf5)}
    else if (input$type == "Poroke po slovenskih regijah"){
      print(zemljevid.regije)}
  })
}
)