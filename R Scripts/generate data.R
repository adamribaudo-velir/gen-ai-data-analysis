library(tidyverse)

# inverse sin waves
df_sin <- data.frame(
  week_index = seq(1:52),
  initial_data = (sin(seq(from = 0,to = 3, length.out=52))) * 100,
  noise_a = sample(10:30, 52, replace = TRUE),
  noise_b = sample(10:30, 52, replace = TRUE)
)

df_sin$dimension_a <- df_sin$initial_data + df_sin$noise_a
df_sin$dimension_b <- df_sin$initial_data * -1 + 100 + df_sin$noise_b

df_sin <- df_sin %>% select(week_index, dimension_a, dimension_b) %>% 
  pivot_longer(cols = !week_index, names_to = "dimension", values_to = "metric")

ggplot(data = df_sin, aes(x = week_index, y = metric, color = dimension)) + 
  geom_line() +
  theme_minimal()

write.csv(df_sin,"sin.csv")

library(tidyverse)

# inverse lines
df_lin <- data.frame(
  week_index = seq(1:52),
  initial_data = (seq(from = 0,to = 1, length.out=52)) * 100,
  noise_a = sample(10:30, 52, replace = TRUE),
  noise_b = sample(10:30, 52, replace = TRUE)
)

df_lin$dimension_a <- df_lin$initial_data + df_lin$noise_a
df_lin$dimension_b <- df_lin$initial_data * -1 + 100 + df_lin$noise_b

df_lin <- df_lin %>% select(week_index, dimension_a, dimension_b) %>% 
  pivot_longer(cols = !week_index, names_to = "dimension", values_to = "metric")

ggplot(data = df_lin, aes(x = week_index, y = metric, color = dimension)) + 
  geom_line() +
  theme_minimal()

write.csv(df_lin,"linear.csv")

# inverse lines, no noise
df_lin <- data.frame(
  week_index = seq(1:52),
  initial_data = (seq(from = 0,to = 1, length.out=52)) * 100
)

df_lin$dimension_a <- df_lin$initial_data
df_lin$dimension_b <- df_lin$initial_data * -1 + 100 

df_lin <- df_lin %>% select(week_index, dimension_a, dimension_b) %>% 
  pivot_longer(cols = !week_index, names_to = "dimension", values_to = "metric")

ggplot(data = df_lin, aes(x = week_index, y = metric, color = dimension)) + 
  geom_line() +
  theme_minimal()

write.csv(df_lin,"linear_no_noise.csv")

# noise
df_noise <- data.frame(
  week_index = seq(1:52),
  noise_a = sample(10:30, 52, replace = TRUE),
  noise_b = sample(10:30, 52, replace = TRUE)
)

df_noise$dimension_a <- df_noise$noise_a
df_noise$dimension_b <- df_noise$noise_b

df_noise <- df_noise %>% select(week_index, dimension_a, dimension_b) %>% 
  pivot_longer(cols = !week_index, names_to = "dimension", values_to = "metric")

ggplot(data = df_noise, aes(x = week_index, y = metric, color = dimension)) + 
  geom_line() +
  theme_minimal()

write.csv(df_noise,"noise.csv")



