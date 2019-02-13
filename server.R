shinyServer(function(input, output, clientData, session) {

### Data Table ----
 
 output$table1 = DT::renderDataTable({(aaa)})
  

### Conflict Map ----
 
 
  updateSliderInput(
    session,
    "long",
    min = min(location$midloc2_xlongitude),
    max = max(location$midloc2_xlongitude))
  
 
  updateSliderInput(
    session,
    "lat",
    min = min(location$midloc2_ylatitude),
    max = max(location$midloc2_ylatitude))
  
  location_f <- reactive({
    location %>%
      filter(between(year, input$year[1], input$year[2]))})
  
  
  output$debug = renderText({
    location <- location_f()
    paste0(dim(location))})
  
  
  output$map <- renderLeaflet({
    location <- location_f()
   
     
    m <- location %>%
      leaflet() %>%
      addTiles('https://{s}.basemaps.cartocdn.com/dark_nolabels/{z}/{x}/{y}{r}.png') %>%
      setView(-0, 0, zoom = 2)
  
      
    if (nrow(location) > 0) {
      m <- m %>%
        addCircles(
          lng = ~ midloc2_xlongitude,
          lat = ~ midloc2_ylatitude,
          radius = 100,
          fillOpacity = 0.3,
          opacity = 0.35,
          weight = 0,
          color = "#F0F0F0",
          fillColor = "#FFF")}})
  
  
  output$table <- DT::renderDataTable({
    location <- location()
    
    
    location <- location %>% select(-popup_info,-size)
    
    
    opts <-
      list(
        pageLength = 5,
        lengthChange = FALSE,
        searching = FALSE,
        info = FALSE,
        pagingType = "full")
    
    
    DT::datatable(d,
                  escape = FALSE,
                  rownames = FALSE,
                  options = opts)})
  
  
  
#### Graph1 ----
  
  
  output$value <- renderPrint({input$select})
  
  
  
  output$map1 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name1) %>%
        select(year, milex) %>%
        accumulate_by( ~ year)),
    aes(year, milex, frame = frame) ) +
      geom_line() + labs(title = 'Military Expenditure Plot 1')) %>%
      layout(
        #title = "Military Expense",
        yaxis = list(
          title = "Monetary Account",
          zeroline = F,
          tickprefix = "Expenses, $"),
        xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5)) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE) %>%
      animation_slider(currentvalue = list(prefix = "Year ")))
  
  
  
  output$map2 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name2) %>%
        select(year, milex) %>%
        accumulate_by( ~ year)),
    aes(year, milex, frame = frame)) +
      geom_line() + labs(title = 'Military Expenditure Plot 2')) %>%
      layout(
        #title = "Military Expense",
        yaxis = list(
          title = "Monetary Account",
          zeroline = F,
          tickprefix = "Expenses, $"),
        xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5)) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE) %>%
      animation_slider(currentvalue = list(prefix = "Year ")))

  
  
    
### Graph 2 ----
  
  
  output$value <- renderPrint({input$select})
  
  
  output$map3 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name3) %>%
        select(year, milper) %>%
        accumulate_by( ~ year)),
    aes(year, milper, frame = frame) ) +
      geom_line() + labs(title = 'Military Personnel Plot 1')) %>%
      layout(
        yaxis = list(
          title = "Personnel Amount",
          zeroline = F,
          tickprefix = "Expenses, $"),
        xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5) ) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE) %>%
      animation_slider(currentvalue = list(prefix = "Year ")))
  
  
  output$map4 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name4) %>%
        select(year, milper) %>%
        accumulate_by( ~ year)),
    aes(year, milper, frame = frame) ) +
      geom_line() + labs(title = 'Military Personnel Plot 2')) %>%
      layout(
        yaxis = list(
          title = "Personnel Amount",
          zeroline = F,
          tickprefix = "Expenses, $"),
        xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5)) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE) %>%
      animation_slider(currentvalue = list(prefix = "Year")))

  
  
  ### Graph 3 ----
  
  
  output$value <- renderPrint({input$select})
  
  
  
  output$map5 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name5) %>%
        select(year, tpop) %>%
        accumulate_by( ~ year)),
    aes(year, tpop, frame = frame) ) +
      geom_line() + labs(title = 'Population Plot 1')) %>%
      layout(
        yaxis = list(
          title = "Total Population",
          zeroline = F,
          tickprefix = "Expenses, $"),
        xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5)) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE ) %>%
      animation_slider(currentvalue = list(prefix = "Year ")))
  
  
  
  output$map6 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name6) %>%
        select(year, tpop) %>%
        accumulate_by( ~ year)),
    aes(year, tpop, frame = frame)) +
      geom_line() + labs(title = 'Population Plot 1')) %>%
      
      layout(
        yaxis = list(
          title = "Total Population",
          zeroline = F,
          tickprefix = "Expenses, $"),
        xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5)) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE ) %>%
      animation_slider(currentvalue = list(prefix = "Year")))

  
  
  
  ### Graph 4 ----
  
  
  output$value <- renderPrint({input$select})

  
  
  output$map7 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name7) %>%
        select(year, irst) %>%
        accumulate_by( ~ year)),
    aes(year, irst, frame = frame)) +
     geom_line() + labs(title = 'Iron and Steel Production Plot 1')) %>%
      layout(
        yaxis = list(
          title = "Iron and Steel Production",
          zeroline = F,
         tickprefix = "Expenses, $"),
          xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5)) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE) %>%
      animation_slider(currentvalue = list(prefix = "Year ")))

  
  
  output$map8 <- renderPlotly(
    ggplotly(ggplot((
      vvv %>%
        filter(StateNme == input$country_name8) %>%
        select(year, irst) %>%
        accumulate_by( ~ year)),
    aes(year, irst, frame = frame)) +
      geom_line() + labs(title = 'Iron and Steel Production Plot 1')) %>%
      layout(
        yaxis = list(
          title = "Iron and Steel Production",
          zeroline = F,
          tickprefix = "Expenses, $"),
        xaxis = list(
          title = "Year",
          zeroline = F,
          showgrid = F),
        margin(b = 5)) %>%
      animation_opts(
        frame = 100,
        transition = 0,
        redraw = FALSE ) %>%
      animation_slider(currentvalue = list(prefix = "Year")))
  
  
  
### Graph 5 ----
  
  
  output$value <- renderPrint({input$select})

  
    
  output$map9 <- renderPlotly(
      ggplot((trade %>%
                filter(statename == input$country_name9) %>%
                select(year, imports, exports) %>%
                accumulate_by( ~ year)), aes(year)) +
        geom_line(aes(y = imports, colour = 'imports')) + 
        geom_line(aes(y = exports, colour = 'exports')) +
        labs(title = 'Trade', x = "Year", y = 'Dollars'))
  
  
  
  output$map10 <- renderPlotly(
    ggplot((trade %>%
              filter(statename == input$country_name10) %>%
              select(year, imports, exports) %>%
              accumulate_by( ~ year)), aes(year)) +
      geom_line(aes(y = imports, colour = 'imports')) + 
      geom_line(aes(y = exports, colour = 'exports')) +
      labs(title = 'Trade', x = "Year", y = "Dollars"))})


