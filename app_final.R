#Thanks to Sharon Machlis
#Author, Practical R for Mass Communication and Journalism - for her invaluable coding help

#load R data file written from app_data.R
load("appdatafile.rdata")

#get rid of possibility of scientific notation
options(scipen = 999)

library(shiny)
library(scales)

# Define UI for application that draws a bar chart
ui <- fluidPage(
  
  # Application title
  titlePanel("How Much Is Spent Sending Special Education Students To Other Schools?"),
  
  # Dropdown
  sidebarLayout(
    sidebarPanel(
      selectInput("mydistrict", "Select District", choices = districts, selected = "Statewide (All Districts)")
    ),
    # Set a place to show a bar chart of spending
    mainPanel(
      
      plotOutput("distSpending")
    )
  )
)

# Define server logic required to draw the barchart
library(ggplot2)

server <- function(input, output) {
  
  # filter data based on user input 
  my_graph_data <- reactive({
    dplyr::filter(df_long, District == input$mydistrict)
  })
  
  # draw the bar chart
  output$distSpending <- renderPlot({
    ggplot(my_graph_data(), aes(x=Year, y=Total)) + 
      geom_col(stat="identity", color = "black", fill="#0072B2") +
      ggtitle(paste(input$mydistrict)) +
      theme_minimal() +
      theme(panel.border = element_blank(), panel.grid.major = element_blank(),
            plot.title = element_text(size = 18, face = "bold"),
            panel.grid.minor = element_blank(), axis.line = element_line(colour = "gray"), 
            axis.title.y=element_blank()) +
      scale_y_continuous(expand = expand_scale(mult = c(0, .1)), label=dollar_format())+
      geom_text(aes(label = dollar(Total), vjust = -0.5))+
      labs(caption = "(Source: State Department of Education / Credit: Patrick Skahill, Connecticut Public Radio)")
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)