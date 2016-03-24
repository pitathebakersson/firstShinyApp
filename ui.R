shinyUI(pageWithSidebar(
  
  headerPanel("Histogram of CO2 uptake by grass"),
  sidebarPanel(
    sliderInput('conc_thresh','Set ambient C02 concentration threshold',value=40,min=0, max=1000, step=1),
    sliderInput('mu','Guess at the mean absorption of CO2 at specified ambient conc',value=25,min=0, max=50, step=0.05),
    
    p('MSE'),
    textOutput('text1'),
    p('Guessed mean'),
    textOutput('text2')
    #textInput(inputId="text1",label="CO2 concentration threshold 0-1000")
#     textInput(inputId="text2",label="Input Text2")
  ),
  mainPanel(
    #plotOutput('newHist'),
    div(class="span6", plotOutput("newHist")),
    div(class="span6", plotOutput("ggplot"))
    
#     p('Output text2'),
#     textOutput('text2'),
#     p('Output text3'),
#     textOutput('text3'),
#     p('Outside text'),
#     textOutput('text4'),
#     p('Inside text, but non-reactive'),
#     textOutput('text5')
  )
  
  
  
))