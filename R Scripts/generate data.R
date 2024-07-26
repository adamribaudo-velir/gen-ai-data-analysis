library(tidyverse)

df_sin <- data.frame(
  week_index = seq(1:52),
  sin_output = (sin(seq(from = 0,to = 3, length.out=52))) * 100,
  noise_a = sample(10:30, 52, replace = TRUE),
  noise_b = sample(10:30, 52, replace = TRUE)
)

df_sin$output <- df_sin$sin_output + df_sin$noise_a
df_sin$correlated_output <- df_sin$sin_output * -1 + 100 + df_sin$noise_b

df_sin <- df_sin %>% select(week_index, output, correlated_output) %>% 
  pivot_longer(cols = !week_index, names_to = "output_type", values_to = "metric")

ggplot(data = df_sin, aes(x = week_index, y = metric, color = output_type)) + 
  geom_line() +
  theme_minimal()

write.csv(df_sin,"sin.csv")

