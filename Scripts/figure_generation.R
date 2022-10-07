
library(tidyverse)
library(scales)


funding <- read.csv("Data/NSERC_funding_inflation_May20.csv")

str(funding)

colnames(funding)

funding$year <- as.factor(funding$year)


poverty_line <- funding %>% 


select(year:four) %>% 


pivot_longer(single:four,
             names_to = "funding",
             values_to = "amount")

NSERC <- funding %>% 
  select(year, CGS_M, PGS_D, CGS_D, PDF) %>% 
  pivot_longer(CGS_M:PDF,
             names_to = "funding", 
             values_to = "amount")

inflation <- funding %>% 
  select(year, ends_with("_inflation")) %>% 
  pivot_longer(CGS_M_inflation:PDF_inflation,
             names_to = "funding",
             values_to = "amount")


inflation_May20 <- funding %>% 
  select(year, ends_with("_infl2")) %>% 
  pivot_longer(CGS_M_infl2:PDF_infl2,
               names_to = "funding",
               values_to = "amount")

# GGPLOT ------------------------------------------------------------------

unique(inflation$funding)

colours = c("CGS_M" = "#440C53",
            "PGS_D" = "#52AD9C",
            #"CGS_D" = "#346F64",
            "PDF" = "#3F88C5",
            "CGS_M_inflation" = "#440C53",
            "PGS_D_inflation" = "#52AD9C",
            #"CGS_D_inflation" = "#346F64", 
            "PDF_inflation" = "#3F88C5",
            "CGS_M_infl2" = "#440C53",
            "PGS_D_infl2" = "#52AD9C",
            #"CGS_D_infl2" = "#346F64", 
            "PDF_infl2" = "#3F88C5")

awards <- NSERC %>%
  filter(funding != 'CGS_D')

award_inlf <- inflation_May20 %>% 
  filter(funding != 'CGS_D_infl2')

awards_inflation <- ggplot(NULL, aes(year, amount,
                                     group = funding)) +
  geom_line(data = poverty_line, lwd = 1,
          colour = "red",
          alpha = 0.7) +
  geom_line(data = awards, lwd = 2.5,
            aes(colour = funding)) +
  #geom_line(data = inflation, lwd = 1.5, linetype = "dotdash",
  #aes(colour = "black")) +
  geom_line(data = award_inlf, lwd = 2.5,
            linetype = "dashed",
            aes(colour = funding)) +
  theme_classic() +
  scale_colour_manual(values = colours,
                      breaks = c("CGS_M", "PGS_D", "PDF")) +
  theme(text = element_text(size = 18),
        panel.border = element_rect(fill = NA),
        axis.title.y = element_text(margin = margin(r = 15)),
        legend.position = "none") +
  #guides(colour = guide_legend(title = "NSERC Award")) +
  labs(x = " ",
       y = "Amount (CAD $)") +
  scale_y_continuous(label = comma,
                     limits = c(15000, 60000)) +
  scale_x_discrete(breaks = c(2003, 2006, 2009,
                              2012, 2015, 2018,2021, 2023))


awards_inflation
