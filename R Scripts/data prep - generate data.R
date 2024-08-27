library(tidyverse)
library("charlatan")

# Create 50 tables with 10 columns and 1000 rows of fake data


table_name <- str_replace_all(tolower(ch_job()), "[^a-zA-Z0-9]", "-")

names <- unique(ch_name(n = 10000))
jobs <- unique(ch_job(n = 10000))
colors <- unique(ch_color_name(n = 10000))

job_phone_number_color <- ch_generate("job", "phone_number", "color_name", n = 10000)
job_currency <- ch_generate("job", "currency", n = 10000)
rgb_color_name <- ch_generate("name","rgb_color", n = 10000)
phone_number_name <- ch_generate("name", "phone_number", n = 10000)
names_values <- data.frame(names = names) %>% 
  mutate(values_a = sample(10000, size=length(names), replace=T)) %>% 
  mutate(values_b = sample(10000, size=length(names), replace=T))
jobs_values <- data.frame(jobs = jobs)%>% 
  mutate(values_a = sample(10000, size=length(jobs), replace=T)) %>% 
  mutate(values_b = sample(10000, size=length(jobs), replace=T))
colors_values <- data.frame(colors = colors)%>% 
  mutate(values_a = sample(10000, size=length(colors), replace=T)) %>% 
  mutate(values_b = sample(10000, size=length(colors), replace=T))

write_csv(job_phone_number_color, "job_phone_number_color.csv")
write_csv(job_currency, "job_currency.csv")
write_csv(rgb_color_name, "rgb_color_name.csv")
write_csv(phone_number_name, "phone_number_name.csv")
write_csv(names_values, "names_values.csv")
write_csv(jobs_values, "jobs_values.csv")
write_csv(colors_values, "colors_values.csv")

