#' Douhau Data Studio Launcher
#' 
#' @param dataDir A path sting of a data directory
#' @export
runDouhauDataStudio <- function(dataDir) {
        baseDir <<- dataDir
        shiny::runApp(appDir = system.file("shiny-app", package = "DouhauDataStudioServer"))
}