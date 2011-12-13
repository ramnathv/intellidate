\name{stamp}
\alias{stamp}
\title{Stamp a date time object based on format of a string}
\usage{
  stamp(string, date_tm = Sys.time())
}
\arguments{
  \item{string}{format to display the date time object}

  \item{date_tm}{the date time object to display}
}
\description{
  Stamp a date time object based on format of a string
}
\examples{
ex = as.POSIXct("2011-10-26 13:38:48 EST")
stamp("jan 1, 1999", ex)           #= "Oct 26, 2011"
stamp("Jan 01", ex)                #= "Oct 26"
stamp("Sunday, May 1, 2000", ex)   #= "Wednesday, October 26, 2011"
stamp("Sun Aug 5", ex)             #= "Wed Oct 26"
stamp("12/31/99", ex)              #= "10/26/11"
stamp("DOB:12/11/00", ex)          #= "DOB:10/26/11"
stamp("15 Oct at 2:30 PM", ex)     #= "26 Oct at  1:38 PM"
}

