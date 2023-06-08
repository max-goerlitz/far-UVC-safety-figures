library(tidyverse)
library(readxl)

# maximal observed depth of CPDs in RHE skin models data frame; data is from Zwicker et al. 2022
cpd <- read_xlsx("../data/Maximal observed depth of CPDs in RHEs based on data from Zwicker et al. 2022.xlsx")

str(cpd) # show structure of the data frame

# Gather columns into rows, calculate mean and standard error
mean_values <- cpd %>%
  gather("Wavelength and dose", "Values", everything()) %>%
  group_by(`Wavelength and dose`) %>%
  summarise(Mean = mean(Values, na.rm = TRUE) + 17,  # Add 17 to each mean value, since in the paper they report that "The measured SC thickness was subtracted on every position" and "The mean SC thickness of RHEs was (17±4.3) µm"
            SEM = sd(Values, na.rm = TRUE) / sqrt(sum(!is.na(Values))))

mean_values # display new data set

penplot <- ggplot(data = mean_values, aes(x = `Wavelength and dose`, y = Mean)) +
  geom_point() +
  scale_y_reverse(limits = c(80, -5), breaks = seq(0,80, by = 10)) + # Set y-axis limits to include 0
  scale_x_discrete(position = "top", # Move the x-axis to the top
                   labels = c(expression("222 nm (150 mJ/cm"^2*")"),
                              expression("233 nm (80 mJ/cm"^2*")"),
                              expression("UV-B (7.5 mJ/cm"^2*")"))) +
  geom_hline(yintercept = c(17, 37+17, 50+17), linetype = "dotted", color = "grey30") + # Add dotted horizontal lines (for the sake of accurately creating the figure in biorender); adding the mean stratum corneum thickness of 17µm to the viable epidermal thickness
  labs(x = NULL,
       y = "Maximal observed depth of CPDs [µm]") +
  theme_classic() +
  theme(axis.title.y = element_text(size = 10, margin = margin(r = 15), face="bold"),  # Increase Y axis label font size and add space
        axis.text = element_text(size = 10), # Increase tick label font size
        axis.line.x = element_line(colour = "black"), # Add a solid x-axis line
        axis.line.y = element_line(colour = "black"), # Add a solid y-axis line
        axis.ticks.y = element_line(colour = "black"), # Add y-axis tick marks
        axis.ticks.x = element_line(colour = "black"), # Add x-axis tick marks
        axis.ticks.length = unit(0.15, "cm"),  # Adjust the length of tick marks
  ) 

penplot

ggsave(filename = "../figure image files/skin_penetration.svg", plot = penplot, units = "mm", width = 140, height = 100, bg = "transparent") # FYI, for some reason I  wasn't able to make the background transparent when saving as a png. Instead, I saved as an svg and manually deleted the white background using Inkscape.
# After creating this initial plot, I further edited it using biorender.com