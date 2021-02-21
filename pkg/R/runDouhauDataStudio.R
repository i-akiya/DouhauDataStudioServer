#' Douhau Data Studio Launcher
#'
#' @param dataDir A path sting of a data directory
#' @param host A hostname or IP. If this argument
#'   is not specified, the shiny.port option is configured automatically.
#' @param port A port number as integer value should listen on. If this argument
#'   is not specified, the shiny.port option is configured automatically.
#' @param launch.browser launch.browser argument can accept a logical value. If
#'   FALSE is populated for this argument, the default browser will not
#'   launched. And in case of TRUE, default will be launted. If this argument is
#'   not specified, the shiny.port option is configured automatically.
#' @export
runDouhauDataStudio <- function(dataDir, host = getOption("shiny.host"), port = getOption("shiny.port"), launch.browser = getOption("shiny.launch.browser", interactive())) {
        baseDir <- dataDir
        shiny::runApp(appDir = system.file("shiny-app", 
                                           package = "DouhauDataStudioServer"),
                                           host = host,
                                           port = port,
                                           launch.browser = launch.browser)
}