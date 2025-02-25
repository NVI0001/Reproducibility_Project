## Differnt plots for mycotoxin data

### Here i first load all packages to be used and load mycotoxin data

``` r
library(tidyverse)
```

    ## Warning: package 'ggplot2' was built under R version 4.3.2

    ## Warning: package 'tidyr' was built under R version 4.3.2

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(ggpubr)
library(ggrepel)
library(knitr)
data1 <- read.csv("Data_Folder/MycotoxinData.csv",na.strings = "na")
str(data1)
```

    ## 'data.frame':    375 obs. of  6 variables:
    ##  $ Treatment     : chr  "Fg" "Fg" "Fg" "Fg" ...
    ##  $ Cultivar      : chr  "Wheaton" "Wheaton" "Wheaton" "Wheaton" ...
    ##  $ BioRep        : int  2 2 2 2 2 2 2 2 2 3 ...
    ##  $ MassperSeed_mg: num  10.29 12.8 2.85 6.5 10.18 ...
    ##  $ DON           : num  107.3 32.6 416 211.9 124 ...
    ##  $ X15ADON       : num  3 0.85 3.5 3.1 4.8 3.3 6.9 2.9 2.1 0.71 ...

``` r
kable(head(data1, n = 5), digits = 3, format = "markdown")
```

| Treatment | Cultivar | BioRep | MassperSeed_mg |   DON | X15ADON |
|:----------|:---------|-------:|---------------:|------:|--------:|
| Fg        | Wheaton  |      2 |         10.291 | 107.3 |    3.00 |
| Fg        | Wheaton  |      2 |         12.803 |  32.6 |    0.85 |
| Fg        | Wheaton  |      2 |          2.847 | 416.0 |    3.50 |
| Fg        | Wheaton  |      2 |          6.500 | 211.9 |    3.10 |
| Fg        | Wheaton  |      2 |         10.179 | 124.0 |    4.80 |

## Question1

We plotted DON on Treatment

``` r
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
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).
    ## Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-1-1.png)<!-- --> \##
Question2 Here i re-arranged the x variable to have NTC as first

``` r
data1$Treatment <- factor(data1$Treatment, levels = c ("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))
Plot1 <- ggplot(data1, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, alpha=0.6,position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("DON (ppm)") +
  theme_classic() +
  #geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  #scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) 
  facet_wrap(~Cultivar, scales = "free")
Plot1
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-2-1.png)<!-- --> \##
Question3 Here we plottted 15DON as y variable

``` r
#question3
Plot2 <- ggplot(data1, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("15ADON") +
  theme_classic() +
  #geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  #scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("NTC", "Fg", "Fg +37", "Fg +40", "Fg +70")) 
  facet_wrap(~Cultivar, scales = "free")
Plot2
```

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-3-1.png)<!-- --> \##
Question 4 We plotted Seed Mass as Y variable

``` r
#question4a
#jpeg("Plot3.jpg", width = 2000, height = 1500, res = 300, quality = 100)
Plot3<-ggplot(data1, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position =  "dodge") +  # Boxplot with proper dodge width
  geom_jitter( pch = 21, alpha=0.6,position = position_jitterdodge(),color = "black") + # Adjusted jitter dodge
  xlab("") +
  ylab("Seed Mass(mg)") +
  theme_classic() +
  #geom_jitter(pch=21,alpha=0.6,position = position_jitterdodge(),color="black")+
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]) ) +
  #scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("", "Fg", "Fg +37", "Fg +40", "Fg +70")) +
  facet_wrap(~Cultivar, scales = "free")
Plot3
```

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
#dev.off()
```

## Question 4b

We arranged all the plots together in one horizontal line

``` r
figure_comb <- ggarrange(
  Plot1,# First plot: water.imbibed
  Plot2,
  Plot3,  # Second plot: bac.even
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 1,  # Arrange the plots in 3 rows
  ncol = 3, # Arrange the plots in 1 column
  common.legend = TRUE
  #legend = TRUE  # Do not include a legend in the combined figure
)
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

``` r
figure_comb
```

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-5-1.png)<!-- --> \##
Question 5 we included test of significance

``` r
### Plots with t-test as significance levels
Plot1a <- Plot1 + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
Plot1a
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

``` r
### Example with combined pvalue and * to indicate significance
Plot2a <- Plot2 + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
Plot2a
```

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-6-2.png)<!-- -->

``` r
Plot3a <- Plot3 + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}")
Plot3a
```

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-6-3.png)<!-- -->

``` r
#Combine all plot
figure_comba <- ggarrange(
  Plot1a,# First plot: water.imbibed
  Plot2a,
  Plot3a,  # Second plot: bac.even
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 1,  # Arrange the plots in 3 rows
  ncol = 3, # Arrange the plots in 1 column
  common.legend = TRUE
  #legend = TRUE  # Do not include a legend in the combined figure
)
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

``` r
figure_comba
```

![](RmarkdownPra2_files/figure-gfm/unnamed-chunk-6-4.png)<!-- -->
