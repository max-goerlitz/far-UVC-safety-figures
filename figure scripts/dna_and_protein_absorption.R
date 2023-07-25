library(tidyverse)
library(readxl)
library(gridExtra)
library(cowplot)
library(scales)

# protein absorption data frame; data available from https://github.com/lennijusten/DNA-absorbance/ ; See file "data-table.csv"
pa <- read.csv("../data/protein-absorption-data-table.csv")

str(pa) # check column names

pa_plot <- ggplot(pa, aes(x = Wavelength, y = Mean.Absorption.Coefficient)) +
  geom_line() +
  geom_ribbon(aes(ymin = Mean.Absorption.Coefficient - Absorption.Coefficient.Std.Dev, ymax = Mean.Absorption.Coefficient + Absorption.Coefficient.Std.Dev), alpha=0.4) +
  geom_text(aes(x = 190, y = 35, label = "a"), size = 5, family = "Arial", color = "black") +
  scale_x_continuous(limits = c(190, 320), breaks = seq(from = 200, to = 320, by = 20)) +
  scale_y_continuous(expand = c(0,0)) +
  labs(x = "Wavelength [nm]",
       y = "Absorption coefficient [ml/mg x cm]") +
  theme_classic() +
  theme(axis.text = element_text(size = 10), # Increase tick label font size
        axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15))  # Increase Y axis label font size and add space
  )

# DNA absorption data frame
da <- read.csv("../data/dna-absorption-data-table.csv")

str(da) # check column names

da_plot <- ggplot(da) +
  geom_line(aes(x = Wavelength, y = Adenine, color = "Adenine", linetype = "Adenine")) +
  geom_line(aes(x = Wavelength, y = Cytosine, color = "Cytosine", linetype = "Cytosine")) +
  geom_line(aes(x = Wavelength, y = Guanine, color = "Guanine", linetype = "Guanine")) +
  geom_line(aes(x = Wavelength, y = Thymine, color = "Thymine", linetype = "Thymine")) +
  geom_text(aes(x = 190, y = 0.0001, label = "b"), size = 5, family = "Arial", color = "black") +
  scale_x_continuous(limits = c(190, 320), breaks = seq(from = 200, to = 320, by = 20)) +
  scale_y_continuous(expand = c(0,0), labels = number_format(accuracy = 0.00001, big.mark = ",")) +
  labs(x = "Wavelength [nm]",
       y = "Absorption coefficient [ml/mg x cm]") +
  scale_color_manual(values = c("Adenine" = "black", "Cytosine" = "#0072B2", "Guanine" = "#009E73", "Thymine" = "#D55E00"),
                     name = "",
                     labels = c("Adenine", "Cytosine", "Guanine", "Thymine")) +
  scale_linetype_manual(values = c("Adenine" = "solid", "Cytosine" = "dotted", "Guanine" = "dashed", "Thymine" = "dotdash"),
                        name = "",
                        labels = c("Adenine", "Cytosine", "Guanine", "Thymine")) +
  theme_classic() +
  theme(legend.position = c(0.7, 0.5),
        legend.justification = c(0, 0),
        legend.background = element_rect(fill = "transparent", color = "transparent"),
        legend.box.background = element_rect(fill = "transparent", color = "transparent"),
        axis.text = element_text(size = 10), 
        axis.title.x = element_text(size = 10, margin = margin(t = 10)), 
        axis.title.y = element_text(size = 10, margin = margin(r = 15))  
  )

# Arrange the plots
plot_grid(pa_plot, da_plot, ncol = 1, align = 'v')


ggsave("../figure image files/protein_and_dna_absorption.pdf", plot_grid(pa_plot, da_plot, ncol = 1, align = 'v'), width = 130, height = 150, unit = "mm", dpi = 600)