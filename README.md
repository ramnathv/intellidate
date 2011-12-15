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

**intellidate** provides five main functions to work with date-time strings. 

1. `str_to_date`: converts a date string to a `Date` object 
2. `stamp`: stamps a date object, given a template string
3. `guess_date_format`: detects all formats matching a date string
4. `guess_time_format`: detects the format of a time string
5. `guess_datetime_format`: detects all formats matching a date-time string


### String to Date (`str_to_date`)

Converts a date string to a `Date` object.

`str_to_date` uses a set of simple heuristics to resolve the date components uniquely. If the date cannot be resolved uniquely, `str_to_date` uses a default ordering of **month-date-year** to break the ambiguity.

```r
str_to_date("12/14/2011")        #= 2011-12-14
str_to_date("14/12/2011")        #= 2011-12-14
str_to_date("11/10/1989", 'mdy') #= 2011-10-11
```

### Stamp (`stamp`) ###

Formats a date-time string based on a user provided template. This function is inspired  by the Ruby gem [stamp](https://github.com/jeremyw/stamp).

Suppose you want to stamp all your graphs based on the message template "Created on Nov 22, 2009 at 23:00 hours". You could do it with `stamp` by calling

```r
now <- Sys.time() #= "2011-12-15 08:28:58 EST"
stamp("Created on Nov 22, 2009 at 23:00 hours", now)
[1] "Created on Dec 15, 2011 at 08:29 hours"
```


### Guess Date Format (`guess_date_format`)

Given a date string, returns all date formats that match it.

```r
guess_date_format("Jan 1, 1999")           #= "%b %e, %Y"
guess_date_format("Sunday, May 1, 2000")   #= "%A, %B %e, %Y"
guess_date_format("Sun Aug 5")             #= "%a %b %e"
guess_date_format('20 01 89')              #= "%d %m %y"
guess_date_format('1 13 89')               #= "%m %d %y" 
guess_date_format('00/13/10')              #= "%y/%d/%m"
guess_date_format("01-01/99") #= c("%m-%d/%y", "%d-%m/%y"))
guess_date_format("12/11/00") #= c("%m/%d/%y", "%d/%m/%y"))
```

