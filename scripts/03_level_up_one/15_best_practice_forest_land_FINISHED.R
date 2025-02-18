library(tidyverse)

world_bank_areas <- read_csv("data/world_bank_areas.csv")

forests <- world_bank_areas %>% 
  filter(year %in% c(1990, 2000, 2010, 2017)) %>% 
  filter(area != "World") %>% 
  mutate(year = as.factor(year))


forests %>% 
  ggplot(aes(x = reorder(area, -forest_land),
             y = forest_land,
             fill = year)) +
  geom_col(width = .6, 
           alpha = .9,
           position = position_dodge(width = .6)) +
  # we can tilt the x-axis labels to make them more readable
  labs(title = "Forest land area by country",
       subtitle = "1990, 2000, 2010, 2017",
       x = "Country",
       y = "Forest land area (sq. km)",
       fill = "Year") +
  scale_fill_viridis_d(option = "magma") +
  theme(axis.text.x = element_text(angle = 65, hjust = 1)) 
