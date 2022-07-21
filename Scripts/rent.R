library(tidyverse)
library(ggsci)

rent <- read.csv("Data/rent_cities.csv")
colnames(rent)
str(rent)

rent <- rent %>% 
  mutate(CGS_difference = CGSM - (year_rent + tuition),
         PGS_difference = PGSD - (year_rent + tuition),
         PDF_difference = PDF - (year_rent + tuition)) 

colnames(rent)

rent_long <- pivot_longer(rent, CGSM:PDF_difference, names_to = "type",
             values_to = "value")


rent_long %>% 
  filter(type %in% c('CGS_difference', 'PGS_difference',
                     'City', 'value')) %>% 
  ggplot(aes(fill = type, x = City,
                   y = value)) + 
  geom_col(position = "dodge") +
  coord_flip() +
  theme_classic() +
  theme(axis.text = element_text(size = 13),
        legend.position = "none") +
  scale_fill_manual(labels = c("CGS-M", "PGS-D"),
                    values = c("#3A5683", "#439A86")) +
  theme(panel.background = element_rect(
    fill = '#C9DFEC'),
    plot.background = element_rect(fill = '#C9DFEC')) +
  labs(x = '', y = 'CAD $') 


ggsave("Figures/rent_tuition.jpeg")
