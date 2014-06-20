library(shiny)

games <- read.csv("boardgames.csv")


shinyServer(function(input,output){
    output$ogames <- renderDataTable({
            n <- input$players
            a <- input$ages
            t <- input$time
            g <- input$genre
            game <- games[games$Player.max>=n & games$Player.min <=n 
                          & games$Min.age <=a & games$Play.time==t
                          & games$Category==g,]
            game[, c(1,8)]
            })
}
)