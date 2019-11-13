library(shiny)
library(plotly)
library(manhattanly)
library(dplyr)


df_imp_hg19_Allpop_CLCLP_tdt <- read.csv("imp_hg19_Allpop_CLCLP_tdt_PlessThanPoint01.txt")

shinyServer(function(input, output) {
  data <-
    eventReactive(input$go, {
      list(
        input$Chromosome
      )
    })
    output$mainText <- renderPrint({
    if(data()[[1]] %in% c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")){
      
      
      output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR == as.integer(data()[[1]])),snp="SNP"))
      
    }else{
      output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR %in% c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)), snp="SNP"))
      
    }
    "ok"
  })
})

