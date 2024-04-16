# Eddie Cubas - COP 4020 - Alternative Language Project
# loading packages
library(hash)
library(methods)
# read in cells.csv
data <- read.csv("cells.csv")

# creating class
setClass("Cell",
        slots = list(
         oem = "character",
         model = "character",
         launch_announced = "integer",
         launch_status = "character",
         body_dimensions = "character",
         body_weight = "numeric",
         body_sim = "character",
         dispay_type = "character",
         display_size = "numeric",
         display_resolution = "character",
         features_sensors = "character",
         platform_os = "character"
        ))

setGeneric("oem", function(object) standardGeneric("oem"))
setGeneric("model", function(object) standardGeneric("model"))
setGeneric("launch_announced", function(object) standardGeneric("launch_announced"))
setGeneric("launch_status", function(object) standardGeneric("launch_status"))
setGeneric("body_dimensions", function(object) standardGeneric("body_dimensions"))
setGeneric("body_weight", function(object) standardGeneric("body_weight"))
setGeneric("body_sim", function(object) standardGeneric("body_sim"))
setGeneric("dispay_type", function(object) standardGeneric("dispay_type"))
setGeneric("display_size", function(object) standardGeneric("display_size"))
setGeneric("display_resolution", function(object) standardGeneric("display_resolution"))
setGeneric("features_sensors", function(object) standardGeneric("features_sensors"))
setGeneric("platform_os", function(object) standardGeneric("platform_os"))

setGeneric("oem<-", function(x, value) standardGeneric("oem<-"))
setGeneric("model<-", function(x, value) standardGeneric("model<-"))
setGeneric("launch_announced<-", function(x, value) standardGeneric("launch_announced<-"))
setGeneric("launch_status<-", function(x, value) standardGeneric("launch_status<-"))
setGeneric("body_dimensions<-", function(x, value) standardGeneric("body_dimensions<-"))
setGeneric("body_weight<-", function(x, value) standardGeneric("body_weight<-"))
setGeneric("body_sim<-", function(x, value) standardGeneric("body_sim<-"))
setGeneric("dispay_type<-", function(x, value) standardGeneric("dispay_type<-"))
setGeneric("display_size<-", function(x, value) standardGeneric("display_size<-"))
setGeneric("display_resolution<-", function(x, value) standardGeneric("display_resolution<-"))
setGeneric("features_sensors<-", function(x, value) standardGeneric("features_sensors<-"))
setGeneric("platform_os<-", function(x, value) standardGeneric("platform_os<-"))

# Define getter methods for the Cell class

setMethod("oem", "Cell", function(object) {
  object@oem
})

setMethod("model", "Cell", function(object) {
  object@model
})

setMethod("launch_announced", "Cell", function(object) {
  object@launch_announced
})

setMethod("launch_status", "Cell", function(object) {
  object@launch_status
})

setMethod("body_dimensions", "Cell", function(object) {
  object@body_dimensions
})

setMethod("body_weight", "Cell", function(object) {
  object@body_weight
})

setMethod("body_sim", "Cell", function(object) {
  object@body_sim
})

setMethod("dispay_type", "Cell", function(object) {
  object@dispay_type
})

setMethod("display_size", "Cell", function(object) {
  object@display_size
})

setMethod("display_resolution", "Cell", function(object) {
  object@display_resolution
})

setMethod("features_sensors", "Cell", function(object) {
  object@features_sensors
})

setMethod("platform_os", "Cell", function(object) {
  object@platform_os
})

# Define setter methods for the Cell class

setReplaceMethod("oem", "Cell", function(x, value) {
  x@oem <- value
  x
})

setReplaceMethod("model", "Cell", function(x, value) {
  x@model <- value
  x
})

setReplaceMethod("launch_announced", "Cell", function(x, value) {
  x@launch_announced <- value
  x
})

setReplaceMethod("launch_status", "Cell", function(x, value) {
  x@launch_status <- value
  x
})

setReplaceMethod("body_dimensions", "Cell", function(x, value) {
  x@body_dimensions <- value
  x
})

setReplaceMethod("body_weight", "Cell", function(x, value) {
  x@body_weight <- value
  x
})

setReplaceMethod("body_sim", "Cell", function(x, value) {
  x@body_sim <- value
  x
})

setReplaceMethod("dispay_type", "Cell", function(x, value) {
  x@dispay_type <- value
  x
})

setReplaceMethod("display_size", "Cell", function(x, value) {
  x@display_size <- value
  x
})

setReplaceMethod("display_resolution", "Cell", function(x, value) {
  x@display_resolution <- value
  x
})

setReplaceMethod("features_sensors", "Cell", function(x, value) {
  x@features_sensors <- value
  x
})

setReplaceMethod("platform_os", "Cell", function(x, value) {
  x@platform_os <- value
  x
})
