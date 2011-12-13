\name{guess_date_format}
\alias{guess_date_format}
\title{Guesses the format of a date in a string.}
\usage{
  guess_date_format(string, default = "mdy")
}
\arguments{
  \item{a}{string consisting of date components}
}
\description{
  Matches date components using a simple heuristic and
  leaves the other elements of the string untouched.
}
\examples{
guess_date_format("Jan 1, 1999")           #= "\%b \%e, \%Y"
guess_date_format("Jan 2001")              #= "\%b \%Y"
guess_date_format("Sunday, May 1, 2000")   #= "\%A, \%B \%e, \%Y"
guess_date_format("Sun Aug 5")             #= "\%a \%b \%e"
guess_date_format("12/31/99")              #= "\%m/\%d/\%y"
guess_date_format("DOB:12/11/00")          #= "DOB:\%m/\%d/\%y"
guess_date_format('20 01 89')              #= "\%d \%m \%y"
guess_date_format('1 13 89')               #= "\%m \%d \%y"
guess_date_format('00/13/10')              #= "\%y/\%d/\%m"
}

