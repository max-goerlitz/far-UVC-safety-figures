library(tidyverse)

# protein absorption data frame; data available from https://github.com/lennijusten/protein-absorbance ; See file "data-table.csv"
pa <- read.csv("../data/protein-absorption-data-table.csv")

str(pa) # check column names

plot <- ggplot(pa, aes(x = Wavelength, y = Mean.Absorption.Coefficient)) +
  geom_line() +
  geom_ribbon(aes(ymin = Mean.Absorption.Coefficient - Absorption.Coefficient.Std.Dev, ymax = Mean.Absorption.Coefficient + Absorption.Coefficient.Std.Dev), alpha=0.4) +
  scale_x_continuous(breaks = seq(from = 200, to = 320, by = 20)) +
  scale_y_continuous(expand = c(0,0)) +
  labs(x = "Wavelength [nm]",
       y = "Absorption coefficient [ml/mg x cm]") +
  theme_classic() +
  theme(axis.text = element_text(size = 10), # Increase tick label font size
        axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15))  # Increase Y axis label font size and add space
  )

plot

ggsave("../figure image files/protein_absorption.pdf", plot, unit = "mm", width = 100, height = 75, dpi = 600)