hirsutosa
=========



[![Build Status](https://api.travis-ci.org/ropenscilabs/hirsutosa.svg)](https://travis-ci.org/ropenscilabs/hirsutosa)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/hirsutosa?color=E664A4)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/hirsutosa)](https://cran.r-project.org/package=hirsutosa)
[![codecov.io](https://codecov.io/github/ropenscilabs/hirsutosa/coverage.svg?branch=master)](https://codecov.io/github/ropenscilabs/hirsutosa?branch=master)

**An R client for [Pilosa]()**


## Installation


```r
remotes::install_github("ropenscilabs/hirsutosa")
```


```r
library('hirsutosa')
```

## Install Pilosa

See <https://www.pilosa.com/docs/latest/installation/>

## Getting started 

### Start Pilosa

`pilosa server`

or similar if running on Docker, etc.

### Create an index


```r
hirs_index_create("repository")
```

### Creat a frame 


```r
hirs_frame_create("repository", "stargazer", 
    time_quantum = "YMD", inverse_enabled = TRUE)
```

And another


```r
hirs_frame_create("repository", "language")
```

### Import data

This part has to be done on the command line, sorry.

Download data

```
curl -O https://raw.githubusercontent.com/pilosa/getting-started/master/stargazer.csv
curl -O https://raw.githubusercontent.com/pilosa/getting-started/master/language.csv
```

Import data into Pilosa

```
pilosa import -i repository -f stargazer stargazer.csv
pilosa import -i repository -f language language.csv
```

### Example queries

Which repositories did user 14 star:


```r
hirs_search("repository", 'Bitmap(frame="stargazer", rowID=14)')
#> $results
#>                                                                                                                              bits
#> 1 1, 2, 3, 362, 368, 391, 396, 409, 416, 430, 436, 450, 454, 460, 461, 464, 466, 469, 470, 483, 484, 486, 490, 491, 503, 504, 514
```

What are the top 5 languages in the sample data:


```r
hirs_search("repository", 'TopN(frame="language", n=5)')
#> $results
#> $results[[1]]
#>   id count
#> 1  5   119
#> 2  1    50
#> 3  4    48
#> 4  9    31
#> 5 13    25
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/hirsutosa/issues)
* License: MIT
* Get citation information for `hirsutosa` in R doing `citation(package = 'hirsutosa')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

[![rofooter](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
