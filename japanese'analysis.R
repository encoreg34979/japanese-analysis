library(shiny)
library(RMeCab)

ui <- fluidPage(
   

   titlePanel("形態素解析を実行"),

   sidebarLayout(
      sidebarPanel(
        textInput("nihongo","ここに日本語を入力","すももももももものうち")
      ),
      tableOutput("value")
      )
   )

server <- function(input, output) {
fun <- reactive({
  x <- enc2native(input$nihongo)
  x <- enc2native(unlist(RMeCabC(x,1)))
  paste(x,names(x),sep = " = ")
})
output$value <- renderTable({
  x <- fun()
  return(x)
})
}

shinyApp(ui = ui, server = server)

