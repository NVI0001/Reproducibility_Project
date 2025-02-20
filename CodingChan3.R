#Codiing Challennge Data Visualization
#load the data
data1 <- read.csv("/Users/temitopefolorunso/Desktop/Computational_Biology/Reproducibility_Project.MycotoxinData.csv",na.strings = "na")
#Check the structure
str(data1)

#Question 1
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(data1, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("DON (ppm)") +
  theme_classic() +
  geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  facet_wrap(~Cultivar, scales = "free")
#question2
Plot1 <- ggplot(data1, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("DON (ppm)") +
  theme_classic() +
  geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) +
  facet_wrap(~Cultivar, scales = "free")
Plot1
#question3
Plot2 <- ggplot(data1, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("15ADON") +
  theme_classic() +
  geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) +
  facet_wrap(~Cultivar, scales = "free")
Plot2
#question4a
Plot3<-ggplot(data1, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("Seed Mass(mg)") +
  theme_classic() +
  geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) +
  facet_wrap(~Cultivar, scales = "free")
Plot3
#question 4b


figure_comb <- ggarrange(
  Plot1,# First plot: water.imbibed
  Plot2,
  Plot3,  # Second plot: bac.even
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 3,  # Arrange the plots in 3 rows
  ncol = 1, # Arrange the plots in 1 column
  common.legend = TRUE
  #legend = TRUE  # Do not include a legend in the combined figure
)
figure_comb
#question 5

#question2
Plot1a <- ggplot(data1, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("DON (ppm)") +
  theme_classic() +
  geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) +
  facet_wrap(~Cultivar, scales = "free")
Plot1a
#question3
Plot2a <- ggplot(data1, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("15ADON") +
  theme_classic() +
  geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) +
  facet_wrap(~Cultivar, scales = "free")
Plot2a
#question4a
Plot3a<-ggplot(data1, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("Seed Mass(mg)") +
  theme_classic() +
  geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) +
  facet_wrap(~Cultivar, scales = "free")
Plot3a
