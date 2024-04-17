# Eddie Cubas - COP 4020 - Alternative Language Project
# loading packages
library(dplyr)

# read in the file
data <- read.csv("cells.csv")

# check if file read is empty
if (nrow(data) == 0) {
  stop("The CSV file is empty. Please provide a file with data.")
}
# clean the data

# replace missing or "-" values with NA
data <- data %>%
  mutate(across(everything(), ~ ifelse(. == "-" | is.na(.), NA, .)))

# clean strings to prepare data type conversion
data$launch_announced <- as.integer(gsub("^([0-9]{4}).*", "\\1", data$launch_announced))
data$body_weight <- as.numeric(gsub(" g.*", "", data$body_weight))
data$display_size <- as.numeric(gsub("^([0-9.]+).*", "\\1", data$display_size))

# convert data types
data <- data %>%
  mutate(
    launch_announced = as.integer(launch_announced),
    body_weight = as.numeric(body_weight),
    display_size = as.numeric(display_size),
  )

# define the Cell class
setClass("Cell",
         slots = list(
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
         ))

# convert data rows to objects of Cell class
cell_objects <- apply(data, 1, function(row) {
  # Convert row to a named list
  row_list <- as.list(row)
  
  # Handle the launch_announced column
  # Convert it to integer and handle missing values
  launch_announced_value <- row_list[["launch_announced"]]
  if (is.na(launch_announced_value) || launch_announced_value == "") {
    launch_announced_value <- NA_integer_  # Set to NA if missing or empty
  } else {
    launch_announced_value <- as.integer(launch_announced_value)
  }
  
  # Create a Cell object using the named list and converted launch_announced_value
  cell <- new("Cell",
              oem = row_list[["oem"]],
              model = row_list[["model"]],
              launch_announced = launch_announced_value,
              launch_status = row_list[["launch_status"]],
              body_dimensions = row_list[["body_dimensions"]],
              body_weight = as.numeric(row_list[["body_weight"]]),
              body_sim = row_list[["body_sim"]],
              display_type = row_list[["display_type"]],
              display_size = as.numeric(row_list[["display_size"]]),
              display_resolution = row_list[["display_resolution"]],
              features_sensors = row_list[["features_sensors"]],
              platform_os = row_list[["platform_os"]]
  )
  
  return(cell)
})


# the CellManager class holds functions to manipulate the Cell class
# define the CellManager class
CellManager <- setRefClass(
  "CellManager",
  fields = list(
    cells = "list"  # List to store Cell objects
  ),
  methods = list(
    initialize = function(cells = list()) {
      .self$cells <- cells
    },
    
    # Calculate statistics on columns
    calculate_statistics = function() {
      stats <- list()
      
      # column names from the first Cell object
      column_names <- slotNames("Cell")
      
      # calculate statistics for each column
      for (col in column_names) {
        column_values <- sapply(.self$cells, function(cell) slot(cell, col))
        
        if (is.numeric(column_values)) {
          # calculate numeric statistics
          stats[[col]] <- list(
            mean = mean(column_values, na.rm = TRUE),
            median = median(column_values, na.rm = TRUE),
            sd = sd(column_values, na.rm = TRUE)
          )
        } else {
          # calculate count of unique values for categorical columns
          stats[[col]] <- list(
            unique_count = length(unique(column_values))
          )
        }
      }
      
      return(stats)
    },
    
    # list unique values for each column
    list_unique_values = function() {
      unique_values <- list()

      # get column names from the first Cell object
      column_names <- slotNames("Cell")
      
      # list unique values for each column
      for (col in column_names) {
        column_values <- sapply(.self$cells, function(cell) slot(cell, col))
        
        # store unique values in the list
        unique_values[[col]] <- unique(column_values)
      }
      
      return(unique_values)
    },
    
    # add a new Cell object to the collection
    add_object = function(cell) {
      if (is(cell, "Cell")) {
        .self$cells <- c(.self$cells, cell)
      } else {
        stop("The object provided is not a Cell object.")
      }
    },
    
    # delete a Cell object from the collection by index
    delete_object = function(index) {
      if (index >= 1 && index <= length(.self$cells)) {
        .self$cells <- .self$cells[-index]
      } else {
        stop("Index out of range.")
      }
    }
  )
)
# Questions for the report
# Q1: What company (oem) has the highest average weight of the phone body?
# highest_avg_weight <- data %>%
#  group_by(oem) %>%
#  summarize(avg_weight = mean(body_weight, na.rm = TRUE)) %>%
#  arrange(desc(avg_weight)) %>%
#  slice(1) %>%
#  select(oem, avg_weight)
#print(highest_avg_weight)

# Q2: Was there any phones that were announced in one year and released in another? 
# What are they? Give me the oem and models.
# announced_released_diff <- data %>%
#  filter(!is.na(launch_announced) & !is.na(launch_status)) %>%
#  mutate(
#    announced_year = as.integer(sub("^([0-9]{4}).*", "\\1", launch_announced)),
#    released_year = as.integer(sub("^.*([0-9]{4}).*$", "\\1", launch_status))
#  ) %>%
#  filter(announced_year != released_year) %>%
#  select(oem, model)
# print(announced_released_diff)

# Q3: How many phones have only one feature sensor?
# library(stringr)
# one_feature_sensor <- data %>%
#  filter(!is.na(features_sensors)) %>%
#  filter(str_count(features_sensors, ",") == 0) %>%
#  nrow()
# print(one_feature_sensor)

# Q4: What year had the most phones launched in any year later than 1999?
# most_phones_launched_year <- data %>%
#  filter(!is.na(launch_announced)) %>%
#  mutate(announced_year = as.integer(sub("^([0-9]{4}).*", "\\1", launch_announced))) %>%
#  filter(announced_year > 1999) %>%
#  count(announced_year) %>%
#  arrange(desc(n)) %>%
#  slice(1) %>%
#  select(announced_year, n)
# print(most_phones_launched_year)
