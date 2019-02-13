navbarPage(
  "Global Military Conflict",
  
### About ----

navbarMenu("Overview",
    tabPanel("About the Project",
             fluidRow(column(12,
               includeMarkdown("intro.md")))),
    tabPanel("The Data",
              fluidRow(DT::dataTableOutput("table1"))),
    tabPanel("About Me",
             fluidRow(column(12,
               includeMarkdown("aboutme.md"))))),
### Map ----

tabPanel("Map",
         sidebarLayout(
           sidebarPanel(width = 2,
             checkboxInput(
               inputId = "showpanel",
               label = "Select Year",
               value = FALSE),
             conditionalPanel(
               condition = "input.showpanel == true",
               sliderInput(
                 "year",
                 "Year",
                 min = 1817,
                 max = 2010,
                 value = c(0, 1000),
                 ticks = FALSE))),
           mainPanel(leafletOutput("map"), height = "100%")),
         fluidRow(column(12,
           includeMarkdown("map.md")))),


### Beginning of Stats ----

navbarMenu("Statistics",
           
### Graph 1 ----

  tabPanel("Military Expenditure",
    setBackgroundImage(src = "nuke.jpg"),
    mainPanel(fluidRow(
      column(
        width = 6,
        selectizeInput(
          "country_name1",
          label = h4("Select First Country"),
          choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))])),
      column(
        width = 6,
        selectizeInput(
          "country_name2",
          label = h4("Select Second Country"),
          choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))]))),
    fluidRow(
      column(width = 6, plotlyOutput('map1')),
      column(width = 6, plotlyOutput('map2'))))),
  
### Graph2 ----

  tabPanel("Military Personnel",
           mainPanel(
             fluidRow(
               column(
                 width = 6,
                 selectizeInput(
                   "country_name3",
                   label = h4("Select First Country"),
                   choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))])),
               column(
                 width = 6,
                 selectizeInput(
                   "country_name4",
                   label = h4("Select Second Country"),
                   choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))]))),
             
             fluidRow(
               column(width = 6, plotlyOutput('map3')),
               column(width = 6, plotlyOutput('map4'))))),

### Graph3 ----

  tabPanel("Total Population",
           mainPanel(fluidRow(
             column(
               width = 6,
               selectizeInput(
                 "country_name5",
                 label = h4("Select First Country"),
                 choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))])),
             column(
               width = 6,
               selectizeInput(
                 "country_name6",
                 label = h4("Select Second Country"),
                 choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))]))),
             
             fluidRow(
               column(width = 6, plotlyOutput('map5')),
               column(width = 6, plotlyOutput('map6'))))),


### Graph4 ----

  tabPanel("Iron & Steel Production",
          mainPanel(fluidRow(
            column(
              width = 6,
              selectizeInput(
                "country_name7",
                label = h4("Select First Country"),
                choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))])),
            column(
              width = 6,
              selectizeInput(
                "country_name8",
                label = h4("Select Second Country"),
                choices = unique(vvv$StateNme)[order(unique(vvv$StateNme))]))),
            fluidRow(
              column(width = 6, plotlyOutput('map7')),
              column(width = 6, plotlyOutput('map8'))))),

### Graph5 ----

    tabPanel("Trade",
             mainPanel(fluidRow(
               column(
                 width = 6,
                 selectizeInput(
                   "country_name9",
                   label = h4("Select First Country"),
                   choices = unique(trade$statename)[order(unique(trade$statename))])),
               column(
                 width = 6,
                 selectizeInput(
                   "country_name10",
                   label = h4("Select Second Country"),
                   choices = unique(trade$statename)[order(unique(trade$statename))]))),
               fluidRow(
                 column(width = 6, plotlyOutput('map9')),
                 column(width = 6, plotlyOutput('map10')))))

)
)
