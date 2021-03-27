library(testthat)
library(shinytest)
library(XML)
library(dplyr)


app <- ShinyDriver$new(system.file("shiny-app", package = "DouhauDataStudioServer"))


test_that("Check to Screen Update", {
        app$setInputs(tabs = "datasets")
        expect_equal(app$getValue('selectedDF'), "ae.xpt")
        
        table_rows <- app$findElements(xpath = '//table[@id=\'DataTables_Table_0\']/tbody/tr')
        expect_equal(length(table_rows), 16)

        footer_massage <- app$findElement(xpath = '//*[@id=\'DataTables_Table_0_info\']')
        expect_equal(footer_massage$getText(), "Showing 1 to 9 of 16 entries")
})


test_that("Check the switch to dm.xpt", {
        app$setInputs(selectedDF = "dm.xpt")
        expect_equal(app$getValue('selectedDF'), "dm.xpt")
        
        table_rows <- app$findElements(xpath = '//table[@id=\'DataTables_Table_1\']/tbody/tr')
        expect_equal(length(table_rows), 5)
        
        footer_massage <- app$findElement(xpath = '//*[@id=\'DataTables_Table_1_info\']')  
        expect_equal(footer_massage$getText(), "Showing 1 to 5 of 5 entries")
})


test_that("Check the switch to lb.xpt", {
        app$setInputs(selectedDF = "lb.xpt")
        expect_equal(app$getValue('selectedDF'), "lb.xpt")
        
        table_rows <- app$findElements(xpath = '//table[@id=\'DataTables_Table_2\']/tbody/tr')
        expect_equal(length(table_rows), 9)
        
        footer_massage <- app$findElement(xpath = '//*[@id=\'DataTables_Table_2_info\']')  
        expect_equal(footer_massage$getText(), "Showing 1 to 83 of 83 entries")
})

