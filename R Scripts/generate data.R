library(tidyverse)

df <- data.frame(
  week_index = seq(1:52),
  sin_output = (sin(seq(from = 0,to = 3, length.out=52))) * 100,
  noise_a = sample(10:30, 52, replace = TRUE),
  noise_b = sample(10:30, 52, replace = TRUE)
)

df$output = df$sin_output + df$noise_a
df$correlated_output <- df$sin_output * -1 + 100 + df$noise_b

df <- df %>% select(week_index, output, correlated_output) %>% 
  pivot_longer(cols = !week_index, names_to = "output_type", values_to = "metric")

ggplot(data = df, aes(x = week_index, y = metric, color = output_type)) + 
  geom_line() +
  theme_minimal()



