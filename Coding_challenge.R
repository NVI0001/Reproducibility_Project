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
#Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zdf_col180 <- zdf$zsquared[180]
write.csv(zdf, "zdf_output.csv", row.names = FALSE)

#Question 5
TipR <-read.csv("TipsR.csv")
str(TipR)
#it is denoted as character.
