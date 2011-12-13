#' Guess strptime format of a date time string
#'
#' @param string date time string whose format is to be guessed
#' @return a string consisting of strptime tokens 
#' @export
guess_datetime_format <- function(string, default = 'mdy'){
  # SPLIT: at the time string
  strings <- split_datetime_string(string)
  
  # APPLY: guess format of each substring
  date_str1 <- guess_date_format(strings[[1]], default)[1]
  time_str  <- guess_time_format(strings[[2]])
  date_str2 <- guess_date_format(strings[[3]], default)[1]
  
  # COMBINE: put them back together in the same order
  date_tm <- Filter(Negate(is.na), c(date_str1, time_str, date_str2))
  return(paste(date_tm, collapse = ""))
}
