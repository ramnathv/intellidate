# Intellidate #

Intelligent parsing of date-time strings.

This package is inspired by the R package [**lubridate**](https://github.com/hadley/lubridate), and the Ruby gem [**stamp**](https://github.com/jeremyw/stamp) 

## Installation ##

This package can be installed from github using the `devtools` package.
```r
require(devtools)
install_github("intellidate", "ramnathv")
```

## Usage ##

**intellidate** provides three main functions to work with a date-time strings. 

1. `guess_date_format`: detects all formats matching a date string
2. `guess_time_format`: detects the format of a time string
3. `guess_datetime_format`: detects all formats matching a date-time string
4.  `str_to_date`: converts a date string to a `Date` object 
5.   `stamp`: stamps a date object, given a template string

### `guess_date_format`

Given a date string in any format, `guess_date_format`  will correctly resolve it, if there is no ambiguity 

```r
guess_date_format("Jan 1, 1999")           #= "%b %e, %Y"
guess_date_format("Sunday, May 1, 2000")   #= "%A, %B %e, %Y"
guess_date_format("Sun Aug 5")             #= "%a %b %e"
guess_date_format('20 01 89')              #= "%d %m %y"
guess_date_format('1 13 89')               #= "%m %d %y" 
guess_date_format('00/13/10')              #= "%y/%d/%m"
```

For date strings with an ambiguous format, `guess_date_format` will return all possible formats that match it.

```r
guess_date_format("01-01/99") #= c("%m-%d/%y", "%d-%m/%y"))
guess_date_format("12/11/00") #= c("%m/%d/%y", "%d/%m/%y"))
```

### `str_to_date`

`str_to_date` converts a date string to a `Date` object using `guess_date_format`. If the ordering of **day-month-year** cannot be resolved without ambiguity, `str_to_date` resolves it with a default ordering `mdy`, that the user can override while calling the function.