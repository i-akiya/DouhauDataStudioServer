library(testthat)
library(shinytest)

app <- ShinyDriver$new(system.file("shiny-app", package = "DouhauDataStudioServer"))


test_that("Application works", {
        # Use compareImages=FALSE because the expected image screenshots were created
        # on a Mac, and they will differ from screenshots taken on the CI platform,
        # which runs on Linux.
        # expect_pass(testApp(system.file("shiny-app", package = "DouhauDataStudioServer"), compareImages = FALSE))
        expect_equal(app$getValue("StudyName"), "CDISC01")
        })

