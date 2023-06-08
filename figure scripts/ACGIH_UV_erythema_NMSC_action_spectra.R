library(tidyverse)
library(readxl)
library(gridExtra)
library(scales)

# loading data frames for ACGIH UV action spectra
acgih <- read_xlsx("/Users/max.goerlitz/Dropbox/1 Projects/SecureBio/LWL safety/Figures/action_spectra_and_tlv_data.xlsx", sheet = "TLV")
acgih_skin <- read_xlsx("/Users/max.goerlitz/Dropbox/1 Projects/SecureBio/LWL safety/Figures/action_spectra_and_tlv_data.xlsx", sheet = "TLV_skin")

# Load data into data frame erythema
erythema <- read_xlsx("/Users/max.goerlitz/Dropbox/1 Projects/SecureBio/LWL safety/Figures/action_spectra_and_TLV_data.xlsx", sheet = "action_spectra")

# Load data into data frame nmsc
nmsc <- read_xlsx("/Users/max.goerlitz/Dropbox/1 Projects/SecureBio/LWL safety/Figures/action_spectra_and_TLV_data.xlsx", sheet = "action_spectra")

# renaming columns to make them easier to handle
acgih <- acgih %>%
  rename("wavel" = "Wavelength (nm)",
         "acgih" = "TLV (mJ/cm^2)",
         "rse" = "Relative Spectral Effectiveness")

acgih_skin <- acgih_skin %>%
  rename("wavel" = "Wavelength (nm)",
         "acgih" = "TLV (mJ/cm^2)",
         "rse" = "Relative Spectral Effectiveness")

# Combine data into one data frame
combined_data <- bind_rows(
  acgih %>% mutate(Type = "acgih"),
  acgih_skin %>% mutate(Type = "acgih_skin"),
  erythema %>% mutate(Type = "erythema"),
  nmsc %>% mutate(Type = "nmsc")
)

# reducing the erythema and NMSC action spectra by a constant to allow for an accurate comparison
erythema$erythema_scaled <- erythema$erythema / max(erythema$erythema) * 0.3
nmsc$nmsc_scaled <- nmsc$nmsc / max(nmsc$nmsc) * 0.15

# Create combined plot
combined_plot <- ggplot() +
  geom_line(data = acgih, aes(x = wavel, y = rse, color = "acgih", linetype = "acgih")) +
  geom_line(data = acgih_skin, aes(x = wavel, y = rse, color = "acgih_skin", linetype = "acgih_skin")) +
  geom_line(data = erythema, aes(x = wavel, y = erythema_scaled, color = "Erythema", linetype = "Erythema")) +
  geom_line(data = nmsc, aes(x = wavel, y = nmsc_scaled, color = "NMSC", linetype = "NMSC")) +
  labs(x = "Wavelength [nm]", y = "Relative Spectral Effectiveness") +
  scale_x_continuous(limits = c(200, 400), breaks = seq(from = 200, to = 400, by = 50)) +
  scale_y_log10(limits = c(0.00003, 1), labels = number_format(accuracy = 0.0001, big.mark = ",")) +
  scale_color_manual(values = c("acgih" = "black","acgih_skin" = "black", "Erythema" = "#D55E00", "NMSC" = "#0072B2"),
                     name = "",
                     labels = c("ACGIH UV (eyes)", "ACGIH UV (skin)", "CIE erythema", "CIE NMSC"),
                     breaks = c("acgih", "acgih_skin", "Erythema", "NMSC")) +
  scale_linetype_manual(values = c("acgih" = "solid", "acgih_skin" = "dotdash", "Erythema" = "dashed", "NMSC" = "dotted"),
                        name = "",
                        labels = c("ACGIH UV (eyes)", "ACGIH UV (skin)", "CIE erythema", "CIE NMSC"),
                        breaks = c("acgih", "acgih_skin", "Erythema", "NMSC")) +
  theme_classic() +
  theme(
    legend.position = c(0.65, 0.5), # Adjust the x and y values for the desired position
    legend.justification = c(0, 0),
    legend.background = element_rect(fill = "transparent", color = "transparent"),
    legend.box.background = element_rect(fill = "transparent", color = "transparent"),
    axis.text = element_text(size = 10), # Increase tick label font size
    axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
    axis.title.y = element_text(size = 10, margin = margin(r = 15))  # Increase Y axis label font size and add space
  )

combined_plot

ggsave("/Users/max.goerlitz/Documents/R Code/far-UVC-safety-figures/figure image files/acgih_erythema_nmsc_one_panel.png", combined_plot, width = 120, height = 75, unit = "mm", dpi = 600)