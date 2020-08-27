CodeBook
================

Purpose
-------

This file contains the description of the variables and modifications that were applied in the original data set.

Variables
---------

The following list describes the top 10 names of the original variables to be used in the data set:

``` r
head(lo)
```

    ##               names
    ## 1 tBodyAcc-mean()-X
    ## 2 tBodyAcc-mean()-Y
    ## 3 tBodyAcc-mean()-Z
    ## 4  tBodyAcc-std()-X
    ## 5  tBodyAcc-std()-Y
    ## 6  tBodyAcc-std()-Z

There are 561 variables in the original data set. Then, the data set has to be filtered in order to get only the mean and std variables. \#\# Collapsed Data set

The followging code has to be executed to find the filtered data set.

``` r
head(lonames)
```

    ## [1] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z"
    ## [4] "tBodyAcc-std()-X"  "tBodyAcc-std()-Y"  "tBodyAcc-std()-Z"

From the 561 variables, only 68 fits in the above mentioned condition.
