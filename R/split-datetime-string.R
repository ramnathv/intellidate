#' Splits a date time string using regex operators from the operators package
#' 
#' Leads to extremely compact code
#' @import operators
#' @examples
#' split_datetime_string("20 Jan 10:30 PM on Sunday")
#' split_datetime_string("20 Jan 10:30 PM")
#' split_datetime_string("10:30:14 on Sunday")
#'
split_datetime_string <- function(string){
  TIME_REGEXP <- "(\\d{1,2})(:)(\\d{2})(\\s*)(:)?(\\d{2})?(\\s*)?([aApP][mM])?"
  date_str <- string %/~% TIME_REGEXP
  time_str <- Reduce("%-~%", date_str, string)
  return(list(date_str[1], time_str, date_str[2]))
}

# I can use regmatches from base R to achieve the same
# DOES NOT WORK AS YET
# split_datetime_string <- function(string){
#     TIME_REGEXP <- "(\\d{1,2})(:)(\\d{2})(\\s*)(:)?(\\d{2})?(\\s*)?([aApP][mM])?" 
#     m <- regexpr(TIME_REGEXP, string, perl = TRUE)
#     time_str <- regmatches(string, m)
#     date_str <- unlist(regmatches(string, m, invert = TRUE))
#     return(list(date_str[1], time_str, date_str[2]))
# }


# split_datetime_string <- function(string){
#   TIME_REGEXP <- "([0-9]{1,2})(:)([0-9]{2})(\\s*)(:)?([0-9]{2})?(\\s*)?([aApP][mM])?"
#   date_str <- strsplit(string, TIME_REGEXP)[[1]]
#   time_str <- Reduce('remove_fixed_pat', as.list(date_str), init = string)
#   return(list(date_str[1], time_str, date_str[2]))
# }
# 
# remove_fixed_pat <- function(pattern, x){
#   gsub(pattern, "", x)
# }
