library(tidyverse)
library(readxl)
library(gridExtra)
library(cowplot)
library(scales)

# loading data frames for ACGIH TLVs
tlv <- read_xlsx("../data/action_spectra_and_tlv_data.xlsx", sheet = "TLV")
tlv_skin <- read_xlsx("../data/action_spectra_and_tlv_data.xlsx", sheet = "TLV_skin")

# check column names in the data frames
colnames(tlv)
colnames(tlv_skin)

# renaming columns to make them easier to handle
tlv <- tlv %>%
  rename("wavel" = "Wavelength (nm)",
         "tlv" = "TLV (mJ/cm^2)",
         "rse" = "Relative Spectral Effectiveness")

tlv_skin <- tlv_skin %>%
  rename("wavel" = "Wavelength (nm)",
         "tlv" = "TLV (mJ/cm^2)",
         "rse" = "Relative Spectral Effectiveness")

acgih_plot <- ggplot() +
  geom_line(data = tlv, aes(x = wavel, y = rse, linetype = "TLV", color = "TLV")) +
  geom_line(data = tlv_skin, aes(x = wavel, y = rse, linetype = "TLV (skin)", color = "TLV (skin)")) +
  geom_text(aes(x = 210, y = 1, label = "a"), size = 5, family = "Arial", color = "black") +
  labs(x = "Wavelength [nm]",
       y = "Relative Spectral Effectiveness") +
  scale_x_continuous(limits = c(200, 400), breaks = seq(from = 200, to = 400, by = 50)) +
  scale_y_log10(limits = c(0.00003, 1), labels = number_format(accuracy = 0.0001, big.mark = ",")) +
  scale_linetype_manual(values = c("TLV" = "solid", "TLV (skin)" = "dashed"),
                        name = "",
                        labels = c("ACGIH UV (eyes)", "ACGIH UV (skin)")) +
  scale_color_manual(values = c("TLV" = "black", "TLV (skin)" = "black"),
                     name = "",
                     labels = c("ACGIH UV (eyes)", "ACGIH UV (skin)")) +
  theme_classic() +
  theme(
    legend.position = c(0.55, 0.6), # Adjust the x and y values for the desired position
    legend.justification = c(0, 0),
    legend.background = element_rect(fill = "transparent", color = "transparent"),
    legend.box.background = element_rect(fill = "transparent", color = "transparent"),
    axis.text = element_text(size = 10), # Increase tick label font size
    axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
    axis.title.y = element_text(size = 10, margin = margin(r = 15)),  # Increase Y axis label font size and add space
    plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm")
  )

# Load data into data frame erythema
erythema <- read_xlsx("../data/action_spectra_and_tlv_data.xlsx", sheet = "action_spectra")

# Create linear scale plot
erythema_plot <- ggplot(erythema, aes(x = wavel, y = erythema)) +
  geom_line(linetype = "solid", color = "#D55E00") +
  geom_text(aes(x = 210, y = 1, label = "b"), size = 5, family = "Arial", color = "black") +
  labs(x = "Wavelength [nm]",
       y = "Relative Spectral Effectiveness") +
  scale_x_continuous(limits = c(200, 400)) +
  scale_y_log10(limits = c(0.00003, 1), labels = number_format(accuracy = 0.0001, big.mark = ",")) +
  theme_classic() +
  theme(axis.text = element_text(size = 10), # Increase tick label font size
        axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15)),  # Increase Y axis label font size and add space
        plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm")
  )

# Load data into data frame nmsc
nmsc <- read_xlsx("../data/action_spectra_and_tlv_data.xlsx", sheet = "action_spectra")

# Create log scale plot
log_plot <- ggplot(nmsc, aes(x = wavel, y = nmsc)) +
  geom_line(linetype = "solid", color = "#0072B2") +
  geom_text(aes(x = 210, y = 1, label = "c"), size = 5, family = "Arial", color = "black") +
  labs(x = "Wavelength [nm]",
       y = "Relative Spectral Effectiveness") +
  scale_x_continuous(limits = c(200, 400)) +
  scale_y_log10(limits = c(0.00003, 1), labels = number_format(accuracy = 0.0001, big.mark = ",")) +
  theme_classic() +
  theme(axis.text = element_text(size = 10), # Increase tick label font size
        axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15)),  # Increase Y axis label font size and add space
        plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm")
  )

# Create linear scale plot
linear_plot <- ggplot(nmsc, aes(x = wavel, y = nmsc)) +
  geom_line(linetype = "solid", color = "#0072B2") +
  geom_text(aes(x = 210, y = 1, label = "d"), size = 5, family = "Arial", color = "black") +
  labs(x = "Wavelength [nm]",
       y = "Relative Spectral Effectiveness") +
  scale_x_continuous(limits = c(200, 400)) +
  theme_classic() +
  theme(axis.text = element_text(size = 10), # Increase tick label font size
        axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15)),  # Increase Y axis label font size and add space
        plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm")
  )

# Arrange the plots
plot_grid(acgih_plot, erythema_plot, log_plot, linear_plot, ncol = 2, align = 'v')


ggsave("../figure image files/ACGIH_erythema_nmsc_four_panels.pdf", plot_grid(acgih_plot, erythema_plot, log_plot, linear_plot, ncol = 2, align = 'v'), width = 200, height = 140, unit = "mm", dpi = 600)