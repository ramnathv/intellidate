\name{guess_time_format}
\alias{guess_time_format}
\title{Guesses the strptime format of a time string}
\usage{
  guess_time_format(string)
}
\arguments{
  \item{string}{a string}
}
\description{
  Guesses the strptime format of a time string
}
\examples{
guess_time_format("12:00 AM")    #=> "\%I:\%M \%p"
guess_time_format("23:59:23")    #=> "\%H:\%M:\%S"
guess_time_format("23:59")       #=> "\%H:\%M"
guess_time_format("23:59:59")    #=> "\%H:\%M:\%S"
guess_time_format("2:24 AM")     #=> "\%l:\%M \%p"
}

