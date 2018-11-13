<!-- README.md is generated from README.Rmd. Please edit that file -->
**NOTE: This is a toy package created for expository purposes. It is not meant to actually be useful. If you want a package for factor handling, please see [forcats](https://cran.r-project.org/package=forcats).**

### foofactors

Factors are a very useful type of variable in R, but they can also drive you nuts. This package provides some helper functions for the care and feeding of factors.

### Installation

``` r
devtools::install_github("jennybc/foofactors")
```

### Quick demo

Binding two factors via `fbind()`:

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
#> [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 x 2
#>   x         n
#>   <fct> <int>
#> 1 a        25
#> 2 b        26
#> 3 c        17
#> 4 d        17
#> 5 e        15
```

We may also want to make a factor and reorder its levels in a descending order (possibly starting from, for example, a vector of strings as an input). Using `reorder()` along with `dplyr::desc()` function can be inconvenient for readability. Which is why `fct_desc()` is very helpful for this purpose. It will return a factor, the levels of which are ordered in a descending order (alphabetically or numerically). If a factor is inputed, it will first get converted into a character vector.

``` r
v1 <- c(1, 1000, 10, 10000)
fct_desc(v1) #ordered numerically in a descending order
#> [1] 1     1000  10    10000
#> Levels: 10000 1000 10 1
```

``` r
f1 <- factor(c(1, 1000, 10, 10000))
fct_desc(f1) #ordered numerically in a descending order
#> [1] 1     1000  10    10000
#> Levels: 10000 1000 10 1
```

``` r
v2 <- c("a", "c", "d")
fct_desc(v2) #ordered alphabetically in a descending order
#> [1] a c d
#> Levels: d c a
```
