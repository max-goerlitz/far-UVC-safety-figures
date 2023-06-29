library(tidyverse)

# load skin transmission dataset, skipping the first two lines and the third line is data, set header = FALSE
skin_t <- read.table("../data/MartinGuttmann_SkinRayTracingModel_2023_withSC.dat", header = FALSE, sep = "\t", , skip = 2)

# set new column names
colnames(skin_t) <- c("wavel", "depth", "relative_intensity", "relative_intensity_error")

# Split the data by wavelength and apply interpolation for each wavelength
data_list <- split(skin_t, skin_t$wavel)

# Create a new dataframe to store interpolated results
interpolated_data <- data.frame()

# Use the 'group_by' function to group data by wavelength, then 'summarize' to apply the interpolation to each group
interpolated_data <- skin_t %>%
  group_by(wavel) %>%
  summarize(
    depth_50 = approx(x = relative_intensity, y = depth, xout = 50)$y,
    depth_10 = approx(x = relative_intensity, y = depth, xout = 10)$y
  )

# Check the structure of the new dataframe
str(interpolated_data)

# Reshape the data from wide to long
long_data <- interpolated_data %>%
  pivot_longer(cols = starts_with("depth"),
               names_to = "intensity",
               values_to = "depth")

str(long_data)

# Create the line plot
skin_t_plot <- ggplot(long_data, aes(x = wavel, y = depth, linetype = intensity)) +
  geom_line(linewidth = 0.7) +
  scale_x_continuous(limits = c(200, 300), breaks = seq(200, 300, by = 20), expand = c(0, 1)) +
  scale_y_reverse(limits = c(100, -5), breaks = seq(0,100, by = 10), expand = c(0, 0)) +
  geom_hline(yintercept = c(16, 81), linetype = "dotted", color = "grey99", alpha = 0.3) + # Add dotted horizontal lines (for the sake of accurately creating the figure in biorender)
  scale_linetype_manual(values = c("depth_50" = "dotdash", "depth_10" = "solid"),
                        labels = c("50% Relative Intensity", "10% Relative Intensity"),
                        breaks = c("depth_50", "depth_10")) +
  labs(x = "Wavelength [nm]",
       y = "Depth [µm]") +
  theme_classic() +
  theme(axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15)),
        axis.text = element_text(size = 10),
        axis.ticks.length = unit(0.15, "cm"),
        legend.position = c(0.2, 0.15),
        legend.title = element_blank(),
        legend.background = element_rect(colour = "white"),
        legend.box.background = element_rect(colour = "black", size = 1),
        legend.margin = margin(0,3,5,0),
        legend.box.margin = margin(0,0,0,0)
        )

skin_t_plot

ggsave(filename = "../figure image files/skin_penetration_based_on_Guttmann_data.svg", plot = skin_t_plot, units = "mm", width = 140, height = 100, bg = "transparent") # FYI, for some reason I  wasn't able to make the background transparent when saving as a png. Instead, I saved as an svg and manually deleted the white background using Inkscape.
# After creating this initial plot, I further edited it using biorender.com
