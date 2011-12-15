#' Stamp a date time object based on format of a string
#'
#' @param string format to display the date time object 
#' @param date_tm the date time object to display
#' @export
#' @examples
#' ex = as.POSIXct("2011-10-26 13:38:48 EST")
#' stamp("jan 1, 1999", ex)           #= "Oct 26, 2011"
#' stamp("Jan 01", ex)                #= "Oct 26"
#' stamp("Sunday, May 1, 2000", ex)   #= "Wednesday, October 26, 2011"
#' stamp("Sun Aug 5", ex)             #= "Wed Oct 26"
#' stamp("12/31/99", ex)              #= "10/26/11"
#' stamp("DOB:12/11/00", ex)          #= "DOB:10/26/11"
#' stamp("15 Oct at 2:30 PM", ex)     #= "26 Oct at  1:38 PM"
stamp <- function(string, date_tm = Sys.time()){
  format(date_tm, guess_datetime_format(string))
}

# Test stamp
# test(stamp) <- function(){
#   ex = as.POSIXct("2011-10-26 13:38:48 EST")
#   checkEquals( stamp("Jan 1, 1999", ex)        , "Oct 26, 2011")
#   checkEquals( stamp("Jan 01", ex)             , "Oct 26")
#   checkEquals( stamp("Sunday, May 1, 2000", ex), "Wednesday, October 26, 2011")
#   checkEquals( stamp("Sun Aug 5", ex)          , "Wed Oct 26")
#   checkEquals( stamp("12/31/99", ex)           , "10/26/11")
#   checkEquals( stamp("DOB:12/11/00", ex)       , "DOB:10/26/11")
#   checkEquals( stamp("15 Oct at 2:30 PM", ex)  , "26 Oct at  1:38 PM")
# }

# TODO:
# 1. Handle ordinals correctly
#    tdy <- as.POSIXct("2011-11-27 16:51:15 EST")
#    stamp('31st Oct 2010', tdy)  #=> 27th Nov 2011

# Issue 23: http://goo.gl/0DOL1
# dat <- as.Date("2011-11-12")
# stamp("21 Aug 2011, 11:15 pm", dat) #=> "12 Nov 2011"
# @svUnit
# @test stamp
# dt <- as.POSIXct("2011-10-26 13:38:48 EST")
# @testfun stamp_dt <- stamp(string, dt)
# 'jan 1, 1999' #=> 'Oct 26, 2011'
