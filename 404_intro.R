library(purrr)
library(magrittr)


my_list = list(
  c(1, 2, 6),
  c(5, 11, 3),
  c(4, 8, 10)
)

# GEt the mean of all vectors manually

mean(my_list[[1]])
mean(my_list[[2]])
mean(my_list[[3]])

# Get the mean of all vectors using 'map'

map(my_list, mean)
map(my_list, function(x) mean(x))


# Explain '.x' and tilde notation

map(my_list, ~ mean(.x))

# -> last thre output, the same, all return a list!

# show type-safe returns (map_db() and friends)

map_dbl(my_list, mean) # return double vectors

# map_int(my_list, mean) # wont work, wrong type!!


# Show 'walk()' for side effect

walk(my_list, mean) # walk return nothing, walk only over it

map_dbl(my_list, ~ {
  .x = .x * 3
  mean(.x)
  median(.x)
}) # open body with curly bracelets

# introduce the pipe

my_list %>% # the stnadinf function, wil be used as the first function in the following functio
  map_dbl(mean) %>%
  map_dbl(~ .x * 3)


#show the same using a for loop

foo3 = rep(1,3)

for (i in seq_along(my_list)) {
  foo3[i] = mean(my_list[[i]])
}
' what if we want to store the values?'


# jed 