# This is R Project
name <- "Temi"
seven <- "7"

name + seven
x + seven
class(seven)
class(x)
x <- 2
vec <- c(1, 2, 3, 4, 5, 6, 7)  # numeric vector 
vec <- c(1:7)  # same numeric vector as above, the ':' (colon) generates a sequence
vec <- 1:7  # also works without the concatenate function
vec2 <- c("Zach", "Jie", "Mitch")  # character vector 
vec3 <- c(TRUE, FALSE, TRUE)  # logical vector
vec + x
summary(vec)
abs(vec) # absolute value
exp(vec) # power of e
log(vec)
t <- 1:10
t[(t > 8) | (t < 5)]
t[(t > 8) & (t < 10)]
mat1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 3)
t[(t > 8) | (t < 5)]  # only the numbers that are greater than 8 or less than 5
t[(t > 8) & (t < 10)]  # returns 9
t[t != 2]  # returns elements of t that are not exactly equal to 2
t[!t == 2] # multiple ways to do the same thing
#We can also ask R if a number exists within a string of numbers 
1 %in% t
## [1] TRUE
mat1 # output mat1 to the console
mat2 <- matrix(data = c("Zach", "Jie", "Tom"), nrow = 3, ncol = 3)
mat2 # output mat1 to the console
getwd()
t[(t > 8) | (t < 5)]  # only the numbers that are greater than 8 or less than 5
t[(t > 8) & (t < 10)]  # returns 9
t[t != 2]  # returns elements of t that are not exactly equal to 2
t[!t == 2] # multiple ways to do the same thing
#We can also ask R if a number exists within a string of numbers 
1 %in% t
## [1] TRUE
df <- data.frame(mat1[,1], mat2[,1]) # created a data frame with the first columns of mat1 and mat2 and all rows
df # output to see in the console
#Now, I don’t like the column headers, so we can use the colnames() function to rename them

colnames(df) <- c("value", "name")
df



#Question 4
#	Create a vector named 'z' with the values 1 to 200
z <- c(1:200)
#o	Print the mean and standard deviation of z on the console
mean (z)
sd(z)
#Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise.
zlog <- z > 30
zlog
#	Make a dataframe with z and zlog as columns. Name the dataframe zdf
zdf <- data.frame(z, zlog)
#o	Change the column names in your new dataframe to equal “zvec” and “zlogic”
colnames(zdf) <- c("zvec","zlogic")
#Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared. 
zdf$zsquared <- zdf$zvec^2
#o	Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100 
zdf_subset1 <- subset(zdf, zsquared > 10 & zsquared < 100)
zdf_subset2 <- zdf[zdf$zsquared > 10 & zdf$zsquared < 100, ]
#Subset the zdf dataframe to only include the values on row 26
zdf_row26 <- zdf[26, ]
subset(zdf)[26,]
#Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zdf_col180 <- zdf$zsquared[180]

#Question 5

<<<<<<< HEAD
TipR <-read.csv("TipsR.csv", na.strings = ".") # na.stirng account for missing value
TipR_data <-read.csv("TipsR.csv", na.strings = "missing") # treat as missing values in the data
=======
TipR <-read.csv("TipsR.csv")
>>>>>>> b6a1bcddad1f4b3d843ddb72f2fcc080076bdb65
str(TipR)
#it is denoted as character.



# Data Visualization
#load data

data <- data("mtcars")
#check the structure 
str(mtcars)
#some plotings
plot(x=mtcars$wt,y=mtcars$mpg)
     
plot (wt~mpg, data=mtcars)

plot(x = mtcars$wt, y = mtcars$mpg,
     xlab = "Car Weight", 
     ylab = "Miles per gallon", 
     font.lab = 10, 
     pch = 15) 
# Using ggplots for ploting
#load the Package
#install.packages("ggplot2")
library(ggplot2)
ggplot()

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = lm, se=FALSE) #find relationships between variables
#change order of data
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, se=FALSE) +
  geom_point()
#Modify the variables
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, se = FALSE, color="grey") +
  geom_point(color ="blue") +
  xlab("Weight") + 
  ylab("Miles per gallon")

ggplot(mtcars, aes(x = wt, y = mpg, size=wt)) + # anything here applies to all the plot
  geom_smooth(method = lm, se = FALSE, color="grey") +
  geom_point(color ="blue") +
  xlab("Weight") + 
  ylab("Miles per gallon")

ggplot(mtcars, aes(x = wt, y = mpg, size=wt)) + # 
  geom_smooth(method = lm, se = FALSE, color="grey") +
  geom_point(aes(x = wt),color ="blue") + #make aesthetics specific
  xlab("Weight") + 
  ylab("Miles per gallon")
ggplot(mtcars, aes(x = wt, y = mpg, size=wt)) + # 
  geom_smooth(method = lm, se = FALSE, color="grey") +
  geom_point(aes(size = wt, color = wt)) + #make aesthetics specific
  xlab("Weight") + 
  ylab("Miles per gallon")

ggplot(mtcars, aes(x = wt, y = mpg, size=wt)) + # 
  geom_smooth(method = lm, se = FALSE, color="grey") +
  geom_point(aes(size = cyl, color = hp)) + #make aesthetics specific
  xlab("Weight") + 
  ylab("Miles per gallon")+
  scale_color_gradient(low = "green",high = "black") #change the color of scale or points
#change the scale to log
ggplot(mtcars, aes(x = wt, y = mpg, size=wt)) + # 
  geom_smooth(method = lm, se = FALSE, color="grey") +
  geom_point(aes(size = cyl, color = hp)) + #make aesthetics specific
  xlab("Weight") + 
  ylab("Miles per gallon")+
  scale_color_gradient(low = "green",high = "black") +
  scale_x_log10() +
  scale_y_continuous(labels = scales::percent) #put percentage bar on the variables

#Categorical Variables Ploting
file.choose()
bull.richness <- read.csv("Bull_richness.csv")

bull.richness.soy.no.till <- bull.richness[bull.richness$Crop == "Soy" & 
                                             bull.richness$Treatment == "No-till",] # subset to soy data

#Barplot to show distributions of data
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) + # boxplot
  geom_boxplot() 

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) + #OUTLIERS DOESN'T SHOW in this kind of data
  geom_boxplot() + 
  xlab("") +
  ylab ("Fungal Richness") +
geom_point(position = position_dodge(width = 0.9)) + #various ways to arrannge the points i.e distributions of your data
geom_point(position=position_jitterdodge(dodge.width=0.9)) #dodging points 
  #ylab("Bulleribasidiaceae richness")

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) + 
  geom_boxplot() + 
  xlab("") + 
  ylab("Bulleribasidiaceae richness") +
  geom_point(position=position_jitterdodge(dodge.width=0.9))

#introducing new measures in the data Stat Summary for Barplot
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) + 
  stat_summary(fun=mean,geom="bar",position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar") + 
  xlab("") + 
  ylab("Fungal richness") +
  geom_point(position=position_jitterdodge(dodge.width=0.9)) 

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness,color =Fungicide, fill = Fungicide)) + #change color
  stat_summary(fun=mean,geom="bar",position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + 
  xlab("") + 
  ylab("Fungal richness") +
  geom_point(position=position_jitterdodge(dodge.width=0.9)) 

#Line plots

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, group =Fungicide, color =Fungicide, fill = Fungicide)) + #change color
  geom_point(position=position_jitterdodge(dodge.width=0.9)) +
   stat_summary(fun=mean,geom="line",position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + 
  xlab("") + 
  ylab("Fungal richness") +
  geom_point(position=position_jitterdodge(dodge.width=0.9)) 



ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean,geom="line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  ylab("Fungal Richness \n richness") + 
  xlab("") 

#faceting

ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean,geom="line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  ylab("Fungal Richness \n richness") + 
  xlab("") +
  facet_wrap(Crop~Treatment, scales = "free")


###Coding_Challenge2
#load the library
library(ggplot2)
library(readr)
#Question 2
#load the data
data1 <- read.csv("/Users/temitopefolorunso/Desktop/Computational_Biology/Reproducibility_Project.MycotoxinData.csv",na.strings = "na")
#Check the structure
str(data1)

#plot the data
ggplot(data1,aes(Treatment,DON, color=Cultivar))+
geom_boxplot() +
  xlab("")+
  ylab ("DON(ppm)")

#3 Bar chat with standard error
ggplot(data1,aes(Treatment,DON, color=Cultivar))+
  stat_summary(fun = mean,geom="bar", position = "dodge") +
  stat_summary(geom = "errorbar",fun.data = mean_se, position = "dodge")+
  xlab("")+
  ylab ("DON(ppm)")

#4
#A
#Barplot with distribution of points
ggplot(data1,aes(Treatment,DON, fill=Cultivar))+
   stat_summary(fun = mean,geom="bar",position = "dodge") +
  stat_summary(geom = "errorbar",fun.data = mean_se, position = "dodge")+
  xlab("")+
  ylab ("DON(ppm)")+
  geom_jitter(pch=21,position = position_jitterdodge(), color="black")
#B
#Boxplot with distribution of points 
ggplot(data1, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("DON (ppm)")
  

#5
#Change of color to reflect some pallette
cbbPalette <- c("#56B4E9","#E69F00","#000000", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(data1,aes(Treatment,DON, color=Cultivar,fill=Cultivar))+
  stat_summary(fun = mean,geom="bar",position = "dodge") +
  stat_summary(geom = "errorbar",fun.data = mean_se, position = "dodge")+
  xlab("")+
  ylab ("DON(ppm)")+
  geom_jitter(pch=21,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values=cbbPalette) +
scale_color_manual(values=cbbPalette)


#6
#Add pallette to the plot based on cultivar
ggplot(data1,aes(Treatment,DON, fill=Cultivar))+
  stat_summary(fun = mean,geom="bar",position = "dodge") +
  stat_summary(geom = "errorbar",fun.data = mean_se, position = "dodge")+
  xlab("")+
  ylab ("DON(ppm)")+
geom_jitter(pch=21,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values=cbbPalette) +
  scale_color_manual(values=cbbPalette)+
facet_wrap(~Cultivar, scales = "free")

#7
#Add transparent to the plot
ggplot(data1,aes(Treatment,DON, fill=Cultivar))+
  stat_summary(fun = mean,geom="bar",position = "dodge") +
  stat_summary(geom = "errorbar",fun.data = mean_se, position = "dodge")+
  xlab("")+
  ylab ("DON(ppm)")+
  geom_jitter(pch=21,alpha=0.4,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values=cbbPalette) +
  facet_wrap(~Cultivar, scales = "free")

#8
#Other ways to represent the data
    ggplot(data1, aes(Treatment,DON, group = Cultivar, color = Cultivar)) + 
      stat_summary(fun=mean,geom="line") +
      stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
      xlab("")+
      ylab ("DON(ppm)")
    
