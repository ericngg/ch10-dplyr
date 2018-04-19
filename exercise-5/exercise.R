# Exercise 5: dplyr grouped operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(delay = mean(dep_delay, na.rm = TRUE))

dep_delay_by_month

# Which month had the greatest average departure delay?
filter(dep_delay_by_month, delay == max(delay)) %>% select(month)

# If your above data frame contains just two columns (e.g., "month", and "delay" in that order), you can create
# a scatterplot by passing that data frame to the 'plot()' function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
arr_delay_by_month <- flights %>%
  group_by(dest) %>%
  summarize (delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(-delay)
  head(arr_delay_by_month)

# You can look up these airports in the `airports` data frame!
filter(airports, faa == arr_delay_by_month$dest[1])

# Which city was flown to with the highest average speed?
  fastest_seed <- flights %>%
    mutate(speed = distance/airtime * 60) %/%
    group_buy(dest) %>%
    summarize(avg_speed = mean(speed, na.rm = TRUE))
    filter(avg_speed == max(avg_speed, nam.rm = TRUE))
    city_fasted_speed
    
