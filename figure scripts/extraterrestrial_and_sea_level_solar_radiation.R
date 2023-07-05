library(readxl)
library(tidyverse)

# Load solar radiation data from .xls files
solar <- read_xls("../data/e490_00a_amo.xls")
sealevel <- read_xls("../data/astmg173.xls", sheet = "SMARTS2")

solar <- solar %>% mutate(Type = "Extraterrestrial", Wavelength = `Wavelength, nm`, Irradiance = `Wehrli, W/m2/nm`) %>%
  select(Type, Wavelength, Irradiance)
sealevel <- sealevel %>% mutate(Type = "Sea Level", Wavelength = `Wvlgth nm`, Irradiance = `Global tilt  W*m-2*nm-1`) %>%
  select(Type, Wavelength, Irradiance)

# Convert Irradiance from W/m^2/nm to mW/cm^2/nm by multiplying with 0.1
solar_converted <- solar %>% mutate(Irradiance_mW = Irradiance * 0.1)
sealevel_converted <- sealevel %>% mutate(Irradiance_mW = Irradiance * 0.1)

# Combine the converted datasets
combined_converted <- rbind(solar_converted, sealevel_converted)

# Print the combined dataset to the console
print(combined_converted)

# Define the max value for the y-axis
ymax <- max(combined_converted$Irradiance_mW, na.rm = TRUE)

# Plot the data with ggplot
cplot <- ggplot(data = combined_converted, aes(x = Wavelength, y = Irradiance_mW, group = Type, color = Type)) +
  geom_line() +
  scale_x_continuous(breaks = seq(200, 700, by = 100), limits = c(200, 710), expand = c(0,0)) +
  scale_y_continuous(limits = c(0, 0.22), expand = c(0,0)) +
  labs(x = "Wavelength [nm]",
       y = expression("Spectral Irradiance [mW/cm"^{2}*"/nm]")) +
  geom_vline(xintercept = c(280, 315, 400), linetype = "dashed", color = "black", linewidth = 0.5) +
  geom_text(aes(x = 240, y = ymax, label = "UV-C"), size = 3, family = "Arial", color = "black") +
  geom_text(aes(x = 297.5, y = ymax, label = "UV-B"), size = 3, family = "Arial", color = "black") +
  geom_text(aes(x = 357.5, y = ymax, label = "UV-A"), size = 3, family = "Arial", color = "black") +
  geom_text(aes(x = 550, y = ymax, label = "Visible"), size = 3, family = "Arial", color = "black") +
  scale_color_manual(values = c("Extraterrestrial" = "#D55E00", "Sea Level" = "#005AB5")) +
  theme_classic() +
  theme(axis.text = element_text(size = 10), # Increase tick label font size
        axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15)),  # Increase Y axis label font size and add space
        legend.position = c(0.65, 0.3), # Adjust the x and y values for the desired position
        legend.justification = c(0, 0),
        legend.background = element_rect(fill = "transparent", color = "transparent"),
        legend.box.background = element_rect(fill = "transparent", color = "transparent")
  )

cplot

ggsave(filename = "../figure image files/combined_solarplot.svg", plot = cplot, unit = "mm", width = 150, height = 100, dpi = 600) # this plot was combined with the figure of the electromagnetic spectrum using Inkscape
# FYI there appears to be a bug that causes the text for "UV-C", "UV-C", "UV-A", and "Visible" to appear thousands of times in the svg file. Unfortunately, I have been unable to fix this.