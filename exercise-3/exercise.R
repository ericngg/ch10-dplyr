# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
acura <- filter(vehicles, make == "Acura", year == 2015)
best <- filter(acura, hwy == max(hwy))
best_acura <- select(best, model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
best_model <- select(
  filter(
    filter(vehicles, make == "Acura", year == 2015, hwy == max(hwy)), model
  )
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best <- filter(vehicles, make == "Acura", year == 2015, hwy == max(hwy)) %>%
  filter(hwy == max(hwy)) %>%
  select(model)

### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times

temp_var <- function() {
  acura <- filter(vehicles, make == "Acura", year == 2015)
  best <- filter(acura, hwy == max(hwy))
  best_acura <- select(best, model)
}

nested <- function() {
  best_model <- select(
    filter(
      filter(vehicles, make == "Acura", year == 2015, hwy == max(hwy)), model
    )
  )
}

pipe <- function() {
  best <- filter(vehicles, make == "Acura", year == 2015, hwy == max(hwy)) %>%
    filter(hwy == max(hwy)) %>%
    select(model)
}

# USED TO CHECK RUNTIMES OF THE FUNCTIONS
system.time(for (i in 1:1000) temp_var())
system.time(for (i in 1:1000) nested())
system.time(for (i in 1:1000) pipe())
