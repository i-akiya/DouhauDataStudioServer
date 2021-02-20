# Douhau Data Studio Server

## Install
```
remotes::install_github("i-akiya/DouhauDataStudioServer/pkg")
```
Restart R may be needed.

## Start Douhau Data Studio Serve
```
library(DouhauDataStudioServer)
runDouhauDataStudio("/path/to/data/dir")
```

### Dependencies
+ shiny
+ shinydashboard
+ dplyr
+ stringr
+ SASxport
+ R4DSXML
+ R.utils
+ yaml
+ DT
