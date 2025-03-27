## Iterations and Functions

Install necessary packages

### Making a function in R for example converting Fahrenheit to Celsius

``` markdown
### Anatomy of a function

sample.function <- function(... variable goes here ...){
  .... code goes here.... 
  return(... output ...)
}
```

``` r
#converting Fahrenheit to celsius formular can be re wriiten like this
#(5*(degree_f - 32)/9)
#Convert 32 ºF to celsius
(5*(32 - 32)/9)
```

    ## [1] 0

``` r
#Convert 80 ºF to celsius
(5*(80 - 32)/9)
```

    ## [1] 26.66667

``` r
# making it a function (fahrenheit_temp) is the object i want to input into the function as a value
F_to_C <- function(fahrenheit_temp){
  celsius <- (5*(fahrenheit_temp - 32)/9)
  return(celsius) #output of the function
}  # Function will be saved

# these do the same thing F_to_C is the name of the variable
F_to_C(32)
```

    ## [1] 0

``` r
F_to_C(67)
```

    ## [1] 19.44444

### convert celsius to fahrenheiht function

``` r
C_to_F <- function(celsius_temp) {
  Farenheiht <- (celsius_temp*(9/5)+32)
  return(Farenheiht)
}

#sample
C_to_F(0)
```

    ## [1] 32

### Iterations using following functions

``` markdown
1. rep() 
2. seq() & seq_along() 
3. for loops map() *nested map()
```

``` r
# Uisng rep() command
rep("A", 3)  # repeats A three times 
```

    ## [1] "A" "A" "A"

``` r
rep(c("A", "B"), 5) # repeats A and B, times i.e multiple thins together
```

    ##  [1] "A" "B" "A" "B" "A" "B" "A" "B" "A" "B"

``` r
rep(c(1,2,3,4), times = 4) # repeats 1,2,3,4, 4 times 
```

    ##  [1] 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4

``` r
rep(c(1,2,5,3), times = 4, each = 4) # repeats 1 four times, 2 four times, 5 four times, and 2 four times.
```

    ##  [1] 1 1 1 1 2 2 2 2 5 5 5 5 3 3 3 3 1 1 1 1 2 2 2 2 5 5 5 5 3 3 3 3 1 1 1 1 2 2
    ## [39] 2 2 5 5 5 5 3 3 3 3 1 1 1 1 2 2 2 2 5 5 5 5 3 3 3 3

``` r
# seq() command allows you to write sequences of numbers easily
1:7
```

    ## [1] 1 2 3 4 5 6 7

``` r
seq(1:7) # sequence of numbers 1 to 7
```

    ## [1] 1 2 3 4 5 6 7

``` r
seq(from = 1, to = 7) # sequence of numbers 1 to 7
```

    ## [1] 1 2 3 4 5 6 7

``` r
seq(from = 0, to = 10, by = 2) # sequence of numbers from 0 to 10 by 2s 
```

    ## [1]  0  2  4  6  8 10

``` r
# combined seq() and rep()
rep(seq(from = 0, to = 10, by = 2), times = 3, each = 2)
```

    ##  [1]  0  0  2  2  4  4  6  6  8  8 10 10  0  0  2  2  4  4  6  6  8  8 10 10  0
    ## [26]  0  2  2  4  4  6  6  8  8 10 10

``` r
LETTERS
```

    ##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
    ## [20] "T" "U" "V" "W" "X" "Y" "Z"

``` r
seq_along(LETTERS) #allows to go letter by letter
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
    ## [26] 26

``` r
seq_along(LETTERS[1:5]) # will return 1,2,3,4,5 not the actual letters.
```

    ## [1] 1 2 3 4 5

### The for loop

``` r
# the classic one , it set up iterations i is the iterations or any letters 
for (i in 1:10) {
print(i*2)  
}
```

    ## [1] 2
    ## [1] 4
    ## [1] 6
    ## [1] 8
    ## [1] 10
    ## [1] 12
    ## [1] 14
    ## [1] 16
    ## [1] 18
    ## [1] 20

``` r
# More complicated for loop
for (i in -30:100){
  result <- F_to_C(i)
  print(result)
}
```

    ## [1] -34.44444
    ## [1] -33.88889
    ## [1] -33.33333
    ## [1] -32.77778
    ## [1] -32.22222
    ## [1] -31.66667
    ## [1] -31.11111
    ## [1] -30.55556
    ## [1] -30
    ## [1] -29.44444
    ## [1] -28.88889
    ## [1] -28.33333
    ## [1] -27.77778
    ## [1] -27.22222
    ## [1] -26.66667
    ## [1] -26.11111
    ## [1] -25.55556
    ## [1] -25
    ## [1] -24.44444
    ## [1] -23.88889
    ## [1] -23.33333
    ## [1] -22.77778
    ## [1] -22.22222
    ## [1] -21.66667
    ## [1] -21.11111
    ## [1] -20.55556
    ## [1] -20
    ## [1] -19.44444
    ## [1] -18.88889
    ## [1] -18.33333
    ## [1] -17.77778
    ## [1] -17.22222
    ## [1] -16.66667
    ## [1] -16.11111
    ## [1] -15.55556
    ## [1] -15
    ## [1] -14.44444
    ## [1] -13.88889
    ## [1] -13.33333
    ## [1] -12.77778
    ## [1] -12.22222
    ## [1] -11.66667
    ## [1] -11.11111
    ## [1] -10.55556
    ## [1] -10
    ## [1] -9.444444
    ## [1] -8.888889
    ## [1] -8.333333
    ## [1] -7.777778
    ## [1] -7.222222
    ## [1] -6.666667
    ## [1] -6.111111
    ## [1] -5.555556
    ## [1] -5
    ## [1] -4.444444
    ## [1] -3.888889
    ## [1] -3.333333
    ## [1] -2.777778
    ## [1] -2.222222
    ## [1] -1.666667
    ## [1] -1.111111
    ## [1] -0.5555556
    ## [1] 0
    ## [1] 0.5555556
    ## [1] 1.111111
    ## [1] 1.666667
    ## [1] 2.222222
    ## [1] 2.777778
    ## [1] 3.333333
    ## [1] 3.888889
    ## [1] 4.444444
    ## [1] 5
    ## [1] 5.555556
    ## [1] 6.111111
    ## [1] 6.666667
    ## [1] 7.222222
    ## [1] 7.777778
    ## [1] 8.333333
    ## [1] 8.888889
    ## [1] 9.444444
    ## [1] 10
    ## [1] 10.55556
    ## [1] 11.11111
    ## [1] 11.66667
    ## [1] 12.22222
    ## [1] 12.77778
    ## [1] 13.33333
    ## [1] 13.88889
    ## [1] 14.44444
    ## [1] 15
    ## [1] 15.55556
    ## [1] 16.11111
    ## [1] 16.66667
    ## [1] 17.22222
    ## [1] 17.77778
    ## [1] 18.33333
    ## [1] 18.88889
    ## [1] 19.44444
    ## [1] 20
    ## [1] 20.55556
    ## [1] 21.11111
    ## [1] 21.66667
    ## [1] 22.22222
    ## [1] 22.77778
    ## [1] 23.33333
    ## [1] 23.88889
    ## [1] 24.44444
    ## [1] 25
    ## [1] 25.55556
    ## [1] 26.11111
    ## [1] 26.66667
    ## [1] 27.22222
    ## [1] 27.77778
    ## [1] 28.33333
    ## [1] 28.88889
    ## [1] 29.44444
    ## [1] 30
    ## [1] 30.55556
    ## [1] 31.11111
    ## [1] 31.66667
    ## [1] 32.22222
    ## [1] 32.77778
    ## [1] 33.33333
    ## [1] 33.88889
    ## [1] 34.44444
    ## [1] 35
    ## [1] 35.55556
    ## [1] 36.11111
    ## [1] 36.66667
    ## [1] 37.22222
    ## [1] 37.77778

``` r
for (i in 0:30){
  result <- C_to_F(i)
  print(result)
}
```

    ## [1] 32
    ## [1] 33.8
    ## [1] 35.6
    ## [1] 37.4
    ## [1] 39.2
    ## [1] 41
    ## [1] 42.8
    ## [1] 44.6
    ## [1] 46.4
    ## [1] 48.2
    ## [1] 50
    ## [1] 51.8
    ## [1] 53.6
    ## [1] 55.4
    ## [1] 57.2
    ## [1] 59
    ## [1] 60.8
    ## [1] 62.6
    ## [1] 64.4
    ## [1] 66.2
    ## [1] 68
    ## [1] 69.8
    ## [1] 71.6
    ## [1] 73.4
    ## [1] 75.2
    ## [1] 77
    ## [1] 78.8
    ## [1] 80.6
    ## [1] 82.4
    ## [1] 84.2
    ## [1] 86

``` r
# printing the results into an object 
celcius.df <- NULL 
for (i in -30:100){   
result_i <- data.frame(F_to_C(i), i)
celcius.df <- rbind.data.frame(celcius.df, result_i) 
}
```

### Complex challenge on how to loop through for non-linear regression

``` r
# read in the data
EC50.data <- read.csv("Data_Folder/EC50.all.csv", na="na")
head(EC50.data)
```

    ##           is location trial set batch      lat conc rep measure coldiam
    ## 1 ILSO_5-41c Illinois     1   1     2 39.06696    0   1       1   71.49
    ## 2 ILSO_5-41c Illinois     1   1     2 39.06696    0   1       2   70.01
    ## 3 ILSO_5-41c Illinois     1   1     2 39.06696    0   2       1   72.86
    ## 4 ILSO_5-41c Illinois     1   1     2 39.06696    0   2       2   70.53
    ## 5 ILSO_5-41c Illinois     1   1     2 39.06696    0   3       1   68.54
    ## 6 ILSO_5-41c Illinois     1   1     2 39.06696    0   3       2   69.09
    ##   coldiamplug relgrowth
    ## 1       67.79 1.0160372
    ## 2       66.31 0.9938549
    ## 3       69.16 1.0365707
    ## 4       66.83 1.0016487
    ## 5       64.84 0.9718225
    ## 6       65.39 0.9800659

``` r
isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == "ILSO_5-41c"] ~ 
        EC50.data$conc[EC50.data$is == "ILSO_5-41c"], 
                       fct = LL.4(fixed = c(NA, NA, NA, NA), #LL.4 is the name of model
                                  names = c("Slope", "Lower", "Upper", "EC50")), 
                       na.action = na.omit)
    # outputs the summary of the paramters including the estimate, standard
    # error, t-value, and p-value outputs it into a data frame called
    # summary.mef.fit for 'summary of fit'
    summary.fit <- data.frame(summary(isolate1)[[3]]) 
    # outputs the summary of just the EC50 data including the estimate, standard
    # error, upper and lower bounds of the 95% confidence intervals around the
    # EC50
    EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
        interval = "delta")[[1]]
```

    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094

``` r
#the result above calculate for just one isolate
```

### Creating loop to iterate each isolate

``` r
#first create a vector
nm <- unique(EC50.data$is)
EC50.ll4 <- NULL # create a null object
for (i in seq_along(nm)) {
  isolate1 <- drm(100 * EC50.data$relgrowth[EC50.data$is == nm[[i]]] ~ 
        EC50.data$conc[EC50.data$is == nm[[i]]], 
                       fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                  names = c("Slope", "Lower", "Upper", "EC50")), 
                       na.action = na.omit)
    # outputs the summary of the paramters including the estimate, standard
    # error, t-value, and p-value outputs it into a data frame called
    # summary.mef.fit for 'summary of fit'
    summary.fit <- data.frame(summary(isolate1)[[3]])
    # outputs the summary of just the EC50 data including the estimate, standard
    # error, upper and lower bounds of the 95% confidence intervals around the
    # EC50
    EC50 <- ED(isolate1, respLev = c(50), type = "relative", 
        interval = "delta")[[1]]
    EC50
    isolate.ec_i <- data.frame(nm[[i]], EC50) # create a one row dataframe containing just the isolate name and the EC50
    colnames(isolate.ec_i) <- c("Isolate", "EC50") # change the column names
    
    # Then we need to append our one row dataframe to our null dataframe we created before
    # and save it as EC50.ll4. 
    EC50.ll4 <- rbind.data.frame(EC50.ll4, isolate.ec_i)
}
```

    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.248655   0.028485 0.190633 0.306678
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.167592   0.010197 0.146821 0.188362
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.184271   0.036047 0.110846 0.257695
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227432   0.040614 0.144704 0.310160
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.101863   0.003487 0.094760 0.108965
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123288   0.014018 0.094735 0.151841
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.69465    0.39164 -0.10310  1.49240
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.113975   0.012773 0.087958 0.139993
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.217436   0.027934 0.160536 0.274335
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.18336    0.01293 0.15695 0.20977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.186929   0.034023 0.117626 0.256232
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.200379   0.020104 0.159429 0.241329
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.30812    0.24033 -0.18142  0.79765
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227103   0.019697 0.186983 0.267224
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20009    0.01448 0.17059 0.22958
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.223966   0.058089 0.105642 0.342290
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.288001   0.074597 0.136052 0.439951
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.369422   0.077015 0.212549 0.526296
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118335   0.011733 0.094404 0.142265
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.189945   0.013146 0.163097 0.216793
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.190146   0.027182 0.134779 0.245514
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16580    0.01082 0.14376 0.18784
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.183297   0.017237 0.148187 0.218407
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.130147   0.010705 0.108342 0.151951
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123034   0.006696 0.109395 0.136673
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.198000   0.019219 0.158853 0.237148
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.159440   0.010423 0.138209 0.180671
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50  0.427766   0.230327 -0.041395  0.896927
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.106855   0.022010 0.062022 0.151687
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.156127   0.021551 0.112229 0.200025
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.308127   0.019233 0.268951 0.347304
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.117014   0.012255 0.092052 0.141977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.177036   0.011915 0.152767 0.201305
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.234268   0.017095 0.199447 0.269088
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.201737   0.012113 0.176998 0.226476
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.306968   0.078617 0.146831 0.467105
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.289597   0.081347 0.123464 0.455730
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.213191   0.024013 0.164278 0.262104
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.42728    0.28840 -0.16016  1.01472
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16319    0.01761 0.12732 0.19906
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20914    0.01403 0.18056 0.23772
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.17905    0.00849 0.16171 0.19639
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.247784   0.036714 0.173000 0.322567
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.235268   0.026532 0.181223 0.289313
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.066926   0.010213 0.046123 0.087728
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.174492   0.010501 0.153102 0.195882
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.181951   0.028336 0.124233 0.239669
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.195576   0.013476 0.168125 0.223027
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.168410   0.010795 0.146421 0.190399
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.162666   0.011066 0.140126 0.185206
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.147113   0.008233 0.130343 0.163883
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118886   0.004502 0.109716 0.128057
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.206342   0.016866 0.171988 0.240696
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.175509   0.013954 0.147086 0.203932
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.65376    0.63282 -0.63525  1.94277
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.211026   0.012571 0.185419 0.236633

``` r
#this calculate for all the isolates
#Produce map of the data
ggplot(EC50.ll4, aes(x = EC50)) + geom_histogram() + theme_classic()
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](Coding_challenge6_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
\### Doing the same, using map with tidy verse

``` r
EC50.data %>%
  group_by(is)%>%
  nest()%>% # allows you to make subdataframe within a dataframe , it keep data tidy in a long format
  mutate(ll.4.mod = map(data, ~drm(.$relgrowth ~ .$conc, 
                              fct = LL.4(fixed = c(NA, NA, NA, NA), 
                                         names = c("Slope", "Lower", "Upper", "EC50")))))%>% #create a new column of summary data of each non-linear regression
  mutate(ec50 = map(ll.4.mod, ~ED(.,  #map is a for loop contain in a function 
                              respLev = c(50), 
                              type = "relative",
                              interval = "delta")[[1]])) %>%
  unnest(ec50) #to get the data out
```

    ## Warning: There were 19 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ll.4.mod = map(...)`.
    ## ℹ In group 4: `is = "C-MNSO2_2-10"`.
    ## Caused by warning in `log()`:
    ## ! NaNs produced
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 18 remaining warnings.

    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.106855   0.022010 0.062022 0.151687
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.177036   0.011915 0.152767 0.201305
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.234268   0.017095 0.199447 0.269088
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0172659  0.0012838 0.0146508 0.0198809
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.117014   0.012255 0.092052 0.141977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.147113   0.008233 0.130343 0.163883
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1376907  0.0077899 0.1218232 0.1535582
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118886   0.004502 0.109716 0.128057
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.206342   0.016866 0.171988 0.240696
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.175509   0.013954 0.147086 0.203932
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.65376    0.63282 -0.63525  1.94277
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.118335   0.011733 0.094404 0.142265
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.189945   0.013146 0.163097 0.216793
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0483296  0.0022658 0.0437143 0.0529448
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.190146   0.027182 0.134779 0.245514
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16580    0.01082 0.14376 0.18784
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.183297   0.017237 0.148187 0.218407
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.130147   0.010705 0.108342 0.151951
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1915200  0.0077369 0.1757605 0.2072795
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123034   0.006696 0.109395 0.136673
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1935594  0.0094277 0.1743559 0.2127629
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.198000   0.019219 0.158853 0.237148
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1114482  0.0070542 0.0970793 0.1258172
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.159440   0.010423 0.138209 0.180671
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1372654  0.0070847 0.1228343 0.1516965
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1070318  0.0055365 0.0957543 0.1183094
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.248655   0.028485 0.190633 0.306678
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.167592   0.010197 0.146821 0.188362
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1082677  0.0051459 0.0977858 0.1187495
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.184271   0.036047 0.110846 0.257695
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.123288   0.014018 0.094735 0.151841
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0998727  0.0044787 0.0907498 0.1089956
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227432   0.040614 0.144704 0.310160
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.101863   0.003487 0.094760 0.108965
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.69465    0.39164 -0.10310  1.49240
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.113975   0.012773 0.087958 0.139993
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.217436   0.027934 0.160536 0.274335
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1102721  0.0033354 0.1034780 0.1170661
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1432333  0.0093132 0.1242629 0.1622036
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.18336    0.01293 0.15695 0.20977
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.186929   0.034023 0.117626 0.256232
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0299288  0.0017812 0.0263007 0.0335569
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.200379   0.020104 0.159429 0.241329
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.30812    0.24033 -0.18142  0.79765
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.227103   0.019697 0.186983 0.267224
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20009    0.01448 0.17059 0.22958
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.223966   0.058089 0.105642 0.342290
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.288001   0.074597 0.136052 0.439951
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.369422   0.077015 0.212549 0.526296
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50  0.427766   0.230327 -0.041395  0.896927
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0991738  0.0040323 0.0909603 0.1073874
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.156127   0.021551 0.112229 0.200025
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.308127   0.019233 0.268951 0.347304
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.201737   0.012113 0.176998 0.226476
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.306968   0.078617 0.146831 0.467105
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.289597   0.081347 0.123464 0.455730
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.213191   0.024013 0.164278 0.262104
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1352667  0.0074545 0.1200824 0.1504511
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.247784   0.036714 0.173000 0.322567
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.235268   0.026532 0.181223 0.289313
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.066926   0.010213 0.046123 0.087728
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.174492   0.010501 0.153102 0.195882
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.181951   0.028336 0.124233 0.239669
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.195576   0.013476 0.168125 0.223027
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.168410   0.010795 0.146421 0.190399
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1546980  0.0093702 0.1354373 0.1739588
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.162666   0.011066 0.140126 0.185206
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50  0.42728    0.28840 -0.16017  1.01472
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.0900834  0.0021351 0.0857344 0.0944324
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1573077  0.0065037 0.1440602 0.1705553
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.16319    0.01761 0.12732 0.19906
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.20914    0.01403 0.18056 0.23772
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error   Lower   Upper
    ## e:1:50  0.17905    0.00849 0.16171 0.19639
    ## 
    ## Estimated effective doses
    ## 
    ##         Estimate Std. Error     Lower     Upper
    ## e:1:50 0.1587569  0.0098007 0.1387411 0.1787727
    ## 
    ## Estimated effective doses
    ## 
    ##        Estimate Std. Error    Lower    Upper
    ## e:1:50 0.211026   0.012571 0.185419 0.236633

    ## # A tibble: 75 × 4
    ## # Groups:   is [75]
    ##    is         data               ll.4.mod   ec50
    ##    <chr>      <list>             <list>    <dbl>
    ##  1 ILSO_5-41c <tibble [36 × 11]> <drc>    0.107 
    ##  2 ILSO_5-42c <tibble [36 × 11]> <drc>    0.249 
    ##  3 ILSO_5-49b <tibble [36 × 11]> <drc>    0.168 
    ##  4 ILSO_6-1   <tibble [36 × 11]> <drc>    0.108 
    ##  5 ILSO_6-12B <tibble [36 × 11]> <drc>    0.184 
    ##  6 ILSO_6-2b  <tibble [36 × 11]> <drc>    0.227 
    ##  7 ILSO_6-33C <tibble [36 × 11]> <drc>    0.102 
    ##  8 ILSO_6-39C <tibble [36 × 11]> <drc>    0.110 
    ##  9 ILSO_6-15b <tibble [36 × 11]> <drc>    0.123 
    ## 10 ILSO_6-28C <tibble [36 × 11]> <drc>    0.0999
    ## # ℹ 65 more rows
