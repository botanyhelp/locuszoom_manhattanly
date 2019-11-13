
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)
library(manhattanly)
library(dplyr)

shinyUI(fluidPage(
  titlePanel("imp_hg19_Allpop_CLCLP_tdt"),
  verticalLayout(
    selectInput(
      "Chromosome",
      "Chromosome",
      c(
        "1" = "1",
        "2" = "2",
        "3" = "3",
        "4" = "4",
        "5" = "5",
        "6" = "6",
        "7" = "7",
        "8" = "8",
        "9" = "9",
        "10" = "10",
        "11" = "11",
        "12" = "12",
        "13" = "13",
        "14" = "14",
        "15" = "15",
        "16" = "16",
        "17" = "17",
        "18" = "18",
        "19" = "19",
        "20" = "20",
        "21" = "21",
        "22" = "22",
        "23" = "23",
        "ALL" = "25"
        #"25" = "25"
        # "23" = "23",
        # "ALL" = "ALL"
      )
    ),
    actionButton("go", "Update Plot"),
    #actionButton("all", "All Chromosomes"),
    plotlyOutput("plotlyPlot"),
    verbatimTextOutput("mainText")
  )
))
