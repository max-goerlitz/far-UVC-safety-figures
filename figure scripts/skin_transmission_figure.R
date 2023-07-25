library(tidyverse)

# load skin transmission dataset, skipping the first two lines and the third line is data, set header = FALSE
skin_t <- read.table("../data/MartinGuttmann_SkinRayTracingModel_2023_withSC.dat", header = FALSE, sep = "\t", , skip = 2)

# set new column names
colnames(skin_t) <- c("wavel", "depth", "relative_intensity", "relative_intensity_error")

# Create a plot using ggplot. The `geom_contour` function is used to draw contour lines on the plot at specified breaks of relative_intensity (z-value), which are 1%, 10%, and 50% in this case.
skin_t_plot <- ggplot(skin_t, aes(x = wavel, y = depth, z = relative_intensity)) +
  geom_contour(breaks = c(1, 10, 50), color = "black") +
  scale_x_continuous(limits = c(200, 300), breaks = seq(200, 300, by = 20), expand = c(0, 1)) +
  scale_y_reverse(limits = c(101, -5), breaks = seq(0,100, by = 10), expand = c(0, 0)) +
  geom_hline(yintercept = c(16, 81), linetype = "dotted", color = "grey99", alpha = 0.3) + # Add dotted horizontal lines (for the sake of accurately creating the figure in biorender)
  annotate("label", x = 210, y = 5, label = "50%", fill="white", color="black") +
  annotate("label", x = 210, y = 20, label = "10%", fill="white", color="black") +
  annotate("label", x = 209, y = 38, label = "1%", fill="white", color="black") +
  labs(x = "Wavelength [nm]",
     y = "Depth [µm]") +
  theme_classic() +
  theme(axis.title.x = element_text(size = 10, margin = margin(t = 10)), # Increase X axis label font size and add space
        axis.title.y = element_text(size = 10, margin = margin(r = 15)),
        axis.text = element_text(size = 10),
        axis.ticks.length = unit(0.15, "cm")
  )

skin_t_plot

ggsave(filename = "../figure image files/skin_penetration_based_on_Guttmann_data_v2.svg", plot = skin_t_plot, units = "mm", width = 140, height = 100, bg = "transparent") # FYI, for some reason I  wasn't able to make the background transparent when saving as a png. Instead, I saved as an svg and manually deleted the white background using Inkscape.
# After creating this initial plot, I further edited it using biorender.com