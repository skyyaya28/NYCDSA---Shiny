### Library ----
library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)
library(DT)
library(leaflet)
library(markdown)
library(shinyWidgets)
library(dplyr)


### Data Files ----
# location = read.csv('disputelocation.csv')#[,-1]
# trade = read.csv('trade.csv')
# capability = read.csv('material.csv')
# ccode = read.csv('country_codes.csv')

### Functions ----
# ccc <- ccode%>%
#   select(StateAbb, StateNme)
# 
# colnames(ccc)[1] <- "stateabb"
# vvv <- merge(x = capability, y = ccc, by = "stateabb", all.x = TRUE)
# 
# aaa <- vvv%>%
#   select(StateNme, stateabb, year, milex, milper, irst, tpop)
# 
# names(aaa) <- c("State Name", "State Abbreviation", "Year", "Expenditure", "Personnel", "Iron and Steel Production", "Total Population")
# 
# vvv$milex <- log(vvv$milex)
# 
# trade$imports <- log(trade$imports)
# 
# trade$exports <- log(trade$exports)


accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}

### Optimizing ----
# save location and vvv to location.Rdata
#save(location, trade, capability, ccode, vvv, ccc, aaa,  file = 'war.Rdata')
# load the varaibel in location.Rdata
load('war.Rdata')
