
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)
library(manhattanly)
library(dplyr)

# TOO MUCH DATA 292 MB
#df_imp_hg19_Allpop_CLCLP_tdt <- read.csv("imp_hg19_Allpop_CLCLP_tdt.txtALL")
# NICER 7 MB
#df_imp_hg19_Allpop_CLCLP_tdt <- read.csv("imp_hg19_Allpop_CLCLP_tdt.txt")
# We have made a file with all points but only if they have P<0.01, like this:
# locuszoom_manhattanly/imp_hg19_Allpop_CLCLP_tdt.txtALL |grep ',0.00'|wc
# 120245  120245 3786904
# locuszoom_manhattanly/imp_hg19_Allpop_CLCLP_tdt_PlessThanPoint01.txt
# ..which is much smaller than the entire file:
# locuszoom_manhattanly/imp_hg19_Allpop_CLCLP_tdt.txtALL |wc 
# 10389766 10389766 305798914
# ..as expected about 100X smaller.
# Therefore this file is 3MB and has only data where P<0.01
#WORKS df_imp_hg19_Allpop_CLCLP_tdt <- read.csv("imp_hg19_Allpop_CLCLP_tdt_PlessThanPoint01.txt")

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
          #WORKSoutput$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt%>% filter(CHR <= data()[[1]]), snp="SNP"))
        #WORKSoutput$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR == data()[[1]]),snp="SNP"))
        #WORKSbutFilter001notNecessaryIfFileAlreadyFiltered
        #output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR == data()[[1]]) %>% filter(P < 0.001),snp="SNP"))
        #output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR == data()[[1]])),snp="SNP"))
        output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR == data()[[1]]),snp="SNP"))
    }else{
        #output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR == "1"), snp="SNP"))
        #output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt, snp="SNP"))
        output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt %>% filter(CHR < "26"), snp="SNP"))
    }
    #summary(df_imp_hg19_Allpop_CLCLP_tdt)
    "ok"
  })
  #TOOSLOWobserveEvent(input$all,{output$plotlyPlot <- renderPlotly(manhattanly(df_imp_hg19_Allpop_CLCLP_tdt, snp="SNP"))})
})
