#' Guesses the format of a date in a string.
#'
#' Matches date components using a simple heuristic and leaves the other
#' elements of the string untouched.
#' @export
#' @param a string consisting of date components
#' @examples
#' guess_date_format("Jan 1, 1999")           #= "%b %e, %Y"
#' guess_date_format("Jan 2001")              #= "%b %Y"
#' guess_date_format("Sunday, May 1, 2000")   #= "%A, %B %e, %Y"
#' guess_date_format("Sun Aug 5")             #= "%a %b %e"
#' guess_date_format("12/31/99")              #= "%m/%d/%y"
#' guess_date_format("DOB:12/11/00")          #= "DOB:%m/%d/%y"
#' guess_date_format('20 01 89')              #= "%d %m %y"
#' guess_date_format('1 13 89')               #= "%m %d %y" 
#' guess_date_format('00/13/10')              #= "%y/%d/%m"
guess_date_format <- function(string, default = 'mdy'){
  DATE_REGEXES <- get_date_regex(default)
  string <- Reduce('pattern_replace', c(string, rep(DATE_REGEXES, 3)))
  unlist(string)
}

str_to_date <- function(string, default = 'mdy'){
  as.Date(string, format = guess_date_format(string, default)[1])
}

#  Comparison to lubridate methods
# 1. date elements can be separated by any non word characters alphanum, _
# 2. automatically detects format if it is unique, else resolves it
test(guess_date_format) <- function(){
  tf <- guess_date_format
  checkEquals( tf("Jan 1, 1999"), "%b %e, %Y")
  checkEquals( tf("Jan 2001") , "%b %Y")
  checkEquals( tf("Sunday, May 1, 2000")   , "%A, %B %e, %Y")
	checkEquals( tf("Sun Aug 5"), "%a %b %e")
	checkEquals( tf("12/31/99"), "%m/%d/%y")
	checkEquals( tf('20 01 89'), "%d %m %y")
	checkEquals( tf('1 13 89') , "%m %d %y")
  checkEquals( tf('24/11/89'), "%d/%m/%y")
	checkEquals( tf('00/13/10'), "%y/%d/%m" )
  checkEquals( tf('01-01/99'), c("%m-%d/%y", "%d-%m/%y"))
  checkEquals( tf("12/11/00"), c("%m/%d/%y", "%d/%m/%y"))
}

# @context Guesses Date Formats Correctly
# @testfun  guess_date_format

# @test identifies unambiguous strftime tokens correctly
# "Jan 13, 1999" => "%b %d, %Y"
# "Jan 2001"     => "%b %Y"
# "24/11/89"     => "%d/%m/%y"

# @test leaves non-matching components as-is
# "DOB:13/11/00" => "DOB:%d/%m/%y"


# @test resolves ambiguities correctly when unique resolution exists
# "Sunday, May 1, 2000" => "%A, %B %e, %Y"
# "Sun Aug 5"           => "%a %b %e"
# "1 13 89"             => "%m %d %y"
# "11/24/2011"          => "%m/%d/%y"

# @test uses default when unique resolution does not exist
# "01-01/99", 'mdy' => "%m-%d/%y"
# "12/11/00", 'dmy' => "%d/%m/%y"

# @test overrides default when unique resolution exists
