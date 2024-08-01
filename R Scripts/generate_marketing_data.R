library(tidyverse)

#### Paid search

spend <-  c(rep(0,26), sample(150:200, 26, replace = TRUE))
clicks <- c(rep(0,26), sample(100:120, 26, replace = TRUE))
paid_search_orders <- c(rep(0,26), sample(50:60, 26, replace = TRUE))

df_paid_search <- data.frame(
  week = seq(1:52),
  spend = spend,
  clicks = clicks,
  paid_search_orders = paid_search_orders
) %>%
  rename(`Paid Search Orders`=paid_search_orders, `Paid Search Clicks`=clicks, `Paid Search Spend` = spend) %>%
  pivot_longer(cols = !week, names_to = "Metric", values_to = "Value")


ggplot(data = df_paid_search, aes(x = week, y = Value, color = Metric)) + 
  geom_line() +
  theme_minimal() + ggtitle("Paid Search Metrics")

write.csv(df_paid_search,"paid_search_metrics.csv")

#### ORDERS

total_orders <- sample(70:75, 52, replace = TRUE)

df_orders <- data.frame(
  week = seq(1:52),
  total_orders = total_orders
) %>% rename(`Total Orders` = total_orders)

ggplot(data = df_orders, aes(x = week, y = `Total Orders`)) + scale_y_continuous(limits=c(0,150)) +
  geom_line() +
  theme_minimal() + ggtitle("Total Orders")

write.csv(df_orders,"orders.csv")

#### ORDERS BY CHANNEL
organic_orders <-  c(sample(50:60, 26, replace = TRUE),rep(0,26))
other_orders <- total_orders - organic_orders - paid_search_orders #subtract remaining

df_orders_by_channel <- data.frame(
  week = seq(1:52),
  organic_orders = organic_orders,
  paid_search_orders = paid_search_orders,
  other_orders = other_orders
) %>% 
  rename(`Organic Search Orders`=organic_orders, `Paid Search Orders`=paid_search_orders, `Other Orders`=other_orders) %>%
 pivot_longer(cols = !week, names_to = "Channel", values_to = "Orders")

ggplot(data = df_orders_by_channel, aes(x = week, y = Orders, color = Channel)) + scale_y_continuous(limits=c(0,75)) +
  geom_line() +
  theme_minimal() + ggtitle("Orders by Channel")

write.csv(df_orders,"orders_by_channel.csv")

