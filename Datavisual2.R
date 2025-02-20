##Home Practice for Data Visualization2

#Load required packages
library(tidyverse)
library(ggpubr)
library(ggrepel)
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#Read data into R
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")
# Change timepoint to factor variable
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
#change the level order for crop
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil", "Cotton", "Soybean"))

str(sample.data.bac)
#Data Plotting
#plot 1
####### Bacterial evenness; Figure 2a ########
bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as even, and color by Crop
  geom_boxplot(position = position_dodge()) +  # Added boxplots with dodged positions to avoid overlap
  geom_point(position = position_jitterdodge(0.05)) +  # Add jittered points to show individual data points, avoiding overlap
  ylab("Time") +  # Label the y-axis as Timepoint
  xlab("Pielou's eveness") +  # Label the x-axis
  scale_color_manual(values = cbbPalette, name = "", labels = c("Soil no seeds", "Cotton spermosphere", "Soybean spermosphere")) +  # Manually set colors and labels for the Crop variable
  theme_classic()   # Use a classic theme for the plot
bac.even

#Plot2 Lineplot
####### Water Imbibition correlate with bacterial evenness; Figure 2b #####
#Subset 
sample.data.bac.nosoil <- subset(sample.data.bac, Crop != "Soil") # this remove soil column from the dataset

water.imbibed <- ggplot(sample.data.bac.nosoil, aes(Time_Point, 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_jitter(width = 0.5, alpha = 0.5) +  # Add jittered points to show individual data points with some transparency
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  # Add lines representing the mean value for each Crop group
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +  # Add error bars representing the standard error of the mean
  xlab("Hours post sowing") +  # Label the x-axis
  ylab("Water Imbibed (mg)") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[6]]), name = "", labels = c("", "")) +  # Manually set colors for the Crop variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +  # Customize theme: remove strip background and position legend to the right
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales
water.imbibed

##### Figure 3 ##### Scatterplot
water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_point(aes(shape = Time_Point)) +  # Add points with different shapes based on Time.Point
  geom_smooth(se = FALSE, method = lm) +  # Add a linear model smooth line without confidence interval shading
  xlab("Water Imbibed (mg)") +  # Label the x-axis
  ylab("Pielou's evenness") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[6]]), name = "", labels = c("Cotton", "Soybean")) +  # Manually set colors for the Crop variable
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # Manually set shapes for the Time.Point variable
  theme_classic() + # Use a classic theme for the plot
  guides(color ="none")+ #Remove color legend
  theme(strip.background = element_blank(), legend.position = "right") +
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales

water.imbibed.cor

## `geom_smooth()` using formula = 'y ~ x'

#Integrating Statistics in to plots for exploratory data
#Anova type 
bac.even + stat_compare_means(method = "anova") #Adding Anova
#Test of siignificance
bac.even +
  geom_pwc(aes(group = Crop), method ="t.test",label = "p.adj.format") #Draw line from one bar to another

### example with * as significance levels
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.signif")
### Example with combined pvalue and * to indicate significance
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
### Example of plot with correlation
water.imbibed.cor + 
  stat_cor(label.y = 0.7) +
  stat_regline_equation()
#### Figure 4; significance levels added with Adobe or powerpoint #### 

# Arrange multiple ggplot objects into a single figure

  figure2 <- ggarrange(
  water.imbibed,  # First plot: water.imbibed
  bac.even,  # Second plot: bac.even
  water.imbibed.cor,  # Third plot: water.imbibed.cor
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 3,  # Arrange the plots in 3 rows
  ncol = 1,  # Arrange the plots in 1 column
  legend = FALSE  # Do not include a legend in the combined figure
)
figure2

#Labeling data
diff.abund <- read.csv("diff_abund.csv")

str(diff.abund)

diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean) #add new column 
diff.abund.label <- diff.abund[diff.abund$log10_pvalue > 25,] # Subseting the data that are significant value greater than 30, numbers can be change as you want the experiment did



ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  theme_classic() + 
  geom_text_repel(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) # Label exactly those that are significant


volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) + 
  scale_color_manual(values = cbbPalette, name = "Significant") +
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano

#Add emphasize of significant by using diff color
volcano1 <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean), shape = 17, color="red",size = 4) +
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label), color ="red") + 
  theme_classic() + 
  scale_color_manual(values = cbbPalette, name = "Significant") +
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano1

library(lme4)
library(emmeans) #version 1.8.7
library(multcomp)
library(multcompView)