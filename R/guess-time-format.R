#' Guesses the strptime format of a time string
#'
#' @param string a string
#' @export 
#' @import stringr
#' @examples
#' guess_time_format("12:00 AM")    #=> "%I:%M %p"
#' guess_time_format("23:59:23")    #=> "%H:%M:%S"
#' guess_time_format("23:59")       #=> "%H:%M"
#' guess_time_format("23:59:59")    #=> "%H:%M:%S"
#' guess_time_format("2:24 AM")     #=> "%l:%M %p"
guess_time_format <- function(string){
  TIME_REGEXES <- get_time_regex()
  string <- Reduce('pattern_replace', c(string, rep(TIME_REGEXES, 3)))[1]
  unique(string)
}

# Test guess_time_format
test(guess_time_format) <- function(){
  tf <- guess_time_format
  checkEquals(tf("12:00 AM"), "%I:%M %p")
  checkEquals(tf("23:59:23"), "%H:%M:%S")
  checkEquals(tf("23:59")   , "%H:%M")
  checkEquals(tf("23:59:59"), "%H:%M:%S")
  checkEquals(tf("2:24 AM") , "%l:%M %p")
}
