# Define the Cell class
Cell <- setClass(
  "Cell",
  slots = c(
    oem = "character",
    model = "character",
    launch_announced = "integer",
    launch_status = "character",
    body_dimensions = "character",
    body_weight = "numeric",
    body_sim = "character",
    display_type = "character",
    display_size = "numeric",
    display_resolution = "character",
    features_sensors = "character",
    platform_os = "character"
  )
)

# Define getter and setter methods for each attribute
setGeneric("getOem", function(object) standardGeneric("getOem"))
setGeneric("setOem", function(object, value) standardGeneric("setOem"))
setMethod("getOem", "Cell", function(object) object@oem)
setMethod("setOem", "Cell", function(object, value) { object@oem <- value; object })

# Read the CSV file
data <- read.csv("cells.csv", stringsAsFactors = FALSE)

# Replace missing or "-" values with NULL
data[data == "-"] <- NA

# Transform data in appropriate columns
data$launch_announced <- as.integer(gsub("[^0-9]", "", data$launch_announced))
data$body_weight <- as.numeric(gsub("[^0-9.]", "", data$body_weight))
data$display_size <- as.numeric(gsub("[^0-9.]", "", data$display_size))

# Convert data types in appropriate columns
data$launch_status <- ifelse(grepl("\\b\\d{4}\\b", data$launch_status), data$launch_status, NA)
data$body_sim <- ifelse(tolower(data$body_sim) %in% c("no", "yes"), NA, data$body_sim)
data$platform_os <- gsub(",.*", "", data$platform_os)

# Create a new dataframe to store cleaned data
cleaned_data <- data.frame(
  oem = data$oem,
  model = data$model,
  launch_announced = data$launch_announced,
  launch_status = data$launch_status,
  body_dimensions = data$body_dimensions,
  body_weight = data$body_weight,
  body_sim = data$body_sim,
  display_type = data$display_type,
  display_size = data$display_size,
  display_resolution = data$display_resolution,
  features_sensors = data$features_sensors,
  platform_os = data$platform_os
)

# Write the cleaned dataset to a new CSV file
write.csv(cleaned_data, "cleaned_cells.csv", row.names = FALSE)
