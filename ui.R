library(shiny)


shinyUI(pageWithSidebar(
    headerPanel("What Board Game Should You Play?"),
    sidebarPanel(h3("Select your game criteria below:"),
                 numericInput("players", h5("How many people are in your group?"), 2, 
                              min=2, max=16, step=1),
                 numericInput("ages", h5("What is the age of your youngest player?"), 
                              3, min=3, max=99, step=1),
                 radioButtons("time", h5("How much time do you have?"),
                                    c("Less than 30 minutes"=0.5,
                                      "An hour or so"=1,
                                      "An hour and a half"=1.5,
                                      "Two hours"=2,
                                      "More than two hours"=3), selected=0.5),
                 radioButtons("genre", h5("What kind of game are you looking for?"),
                                    c("Good for kids"="Children", 
                                      "Fun for the whole family!"="Family", 
                                      "Fun, and possibly embarassing"="Party",
                                      "Strategy games!"="Strategy",
                                      "Games where you work as a team"="Cooperative",
                                      "Lots of thinking, 2 player games"="Abstract",
                                      "War games"="War"), selected="Children")
                 ),
    mainPanel(
        "Attribution: All game information is from the Wikipedia and BoardGameGeek websites.",
        br(), br(),
        tabsetPanel(type = "tabs", 
            tabPanel("Games",
                h3("Games you might be interested in:"),
                br(), 
                "Note: If the screen below says 'Processing' then there is no game in the database matching your criteria. Sorry!",
                br(), br(),
                dataTableOutput("ogames")),
            tabPanel("Using this App",
                "There are four inputs for this App, and all of them are required. The App will update each time you change one option, suggesting one or more games you can play given your criteria!",
                br(), br(),
                "1. The number of people who want to play the game. Simply input a single numeric value between 2 and 16.",
                br(),
                "2. The age of the youngest person in your gaming group. Input a single numeric value between 3 and 99.",
                br(),
                "3. The amount of time you want to spend playing the game. Select one of the options.",
                br(),
                "4. The type of game you'd like to play. Select one of the options. If you are not a hardcore gamer, pick an option with 'fun' in it!",
                br(), br(),
                "If the screen in the 'Games' tab says 'Processing', then there is no game in the database matching your criteria, so modify your criteria.",
                br(), br(),
                "Enjoy!"
                     )
        )
    )
))