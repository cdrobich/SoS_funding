library(tidyverse)
library(ggsci)


# Grad Students -----------------------------------------------------------

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
  ggplot(aes(x = reorder(City, + value), y = value, fill = type)) + 
  geom_col(position = "dodge") +
  coord_flip() +
  theme_minimal() +
  theme(axis.text = element_text(size = 16),
        legend.position = "none") +
  scale_fill_manual(labels = c("CGS-M", "PGS-D"),
                    values = c("#3A5683", "#439A86")) +
  theme(panel.background = element_rect(
    fill = '#C9DFEC'),
    plot.background = element_rect(fill = '#C9DFEC')) +
  labs(x = '', y = 'CAD $') +
  geom_hline(yintercept = 0, lwd = 2, linetype = "solid",
             colour = '#EE6C4D') +
  scale_y_continuous(label = comma,
                     limits = c(-25000, 10000))


ggsave("Figures/rent_tuition.jpeg")


# Postdocs ----------------------------------------------------------------

pdf <- read.csv('Data/pdf_costofliving.csv')
colnames(pdf)
str(pdf)

pdf <- pdf %>% 
  mutate(difference = 45000 - yearly_expenses)


write.csv(pdf, "Data/pdf_differences.csv", row.names = FALSE)

pdf %>% 
  arrange(desc(difference)) %>% 
  ggplot(aes(x = City, y = difference)) +
  geom_segment( aes(x = City, xend = City,
                    y = 0, yend = difference),
                lwd = 2, color = "#293241") +
  geom_point( color = "#EE6C4D", size=6) +
  theme_light() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text = element_text(size = 14)
  ) +
  xlab("") +
  ylab("CAD ($)") +
  scale_y_continuous(labels = scales::comma,
                     limits = c(-40000, 10000))



