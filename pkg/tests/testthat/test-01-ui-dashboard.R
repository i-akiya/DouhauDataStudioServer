library(testthat)
library(shinytest)
library(XML)
library(dplyr)

getElementValue <- function(xmlDoc, xpathString){
        doc <- xmlParseString(xmlDoc)
        elementValue <- XML::xpathApply(doc, xpathString, xmlValue) %>%  
                unlist()
        return(elementValue)
}

app <- ShinyDriver$new(system.file("shiny-app", package = "DouhauDataStudioServer"))


test_that("Check the Study Name", {
        expect_equal(app$getValue("StudyName"), "CDISC01")
        })


test_that("Check the Study Description", {
        expect_equal(app$getValue("StudyDescription"), "CDISC Test Study")
})


test_that("Check the Standard Name Info-Box-Text", {
        htmlFragment <- app$getValue("standardName")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-text"]/text()')
        
        expect_equal(extractedValue, "SDTM")
})


test_that("Check the Standard Name Info-Box-Number", {
        htmlFragment <- app$getValue("standardName")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-number"]/text()')
        
        expect_equal(extractedValue, "SDTM-IG 3.1.2")
})


test_that("Check the Number of Datasets Info-Box-Text", {
        htmlFragment <- app$getValue("numberOfDatasets")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-text"]/text()')
        
        expect_equal(extractedValue, "Number of Datasets")
})

test_that("Check the Number of Datasets Info-Box-Number", {
        htmlFragment <- app$getValue("numberOfDatasets")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-number"]/text()')
        
        expect_equal(extractedValue, "34")
})


test_that("Check the Number of Subjects Info-Box-Text", {
        htmlFragment <- app$getValue("numberOfSubjects")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-text"]/text()')
        
        expect_equal(extractedValue, "Subjects")
})


test_that("Check the Number of Subjects Info-Box-Number", {
        htmlFragment <- app$getValue("numberOfSubjects")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-number"]/text()')
        
        expect_equal(extractedValue, "5")
})


test_that("Check the Number of AEs Info-Box-Text", {
        htmlFragment <- app$getValue("numberOfAes")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-text"]/text()')
        
        expect_equal(extractedValue, "AEs")
})


test_that("Check the Number of AEs Info-Box-Number", {
        htmlFragment <- app$getValue("numberOfAes")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-number"]/text()')
        
        expect_equal(extractedValue, "16")
})


test_that("Check the Number of Deaths Info-Box-Text", {
        htmlFragment <- app$getValue("numberOfDeaths")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-text"]/text()')
        
        expect_equal(extractedValue, "Deaths")
})


test_that("Check the Number of Deaths Info-Box-Number", {
        htmlFragment <- app$getValue("numberOfDeaths")
        extractedValue <- getElementValue(htmlFragment, '//span[@class="info-box-number"]/text()')
        
        expect_equal(extractedValue, "DTHFL variable does not exist.")
})



test_that("Check the nuber of files", {
        htmlFragment <- app$getValue("filelistTable")
        doc <- xmlParseString(htmlFragment)
        extractedValue <- XML::xpathApply(doc, 
                        'count(//table/tbody/tr)',                
                         xmlValue)

        expect_equal(extractedValue, 40)
})


test_that("Check the nuber of records in TS dataset", {
        htmlFragment <- app$getValue("tsTable")
        doc <- xmlParseString(htmlFragment)
        extractedValue <- XML::xpathApply(doc, 
                                          'count(//table/tbody/tr)',                
                                          xmlValue)
        
        expect_equal(extractedValue, 29)
})
