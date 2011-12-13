# Defines regexes matching date components and the associated strftime tokens
get_date_regex <- function(default = 'mdy'){
	day.name <- str_c(c('Mon', 'Tues', 'Wednes', 'Thurs', 'Fri', 'Satur', 'Sun'),'day')
  day.abbr <- c('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')
  DATE_REGEXES <- list(
    M_NAME    = list(month.name, "%B"), M_ABBR    = list(month.abb , "%b"),
    D_NAME    = list(day.name  , "%A"), D_ABBR    = list(day.abbr  , "%a"),
    Y_4_DIG   = list("[0-9]{4}", "%Y"), Y_2_DIG   = list(c("00", 32:99), "%y"),
    DY_2_DIG  = list(13:31, c("%d", "%y")),
    ALL_2_DIG = list(sprintf("%02d", 1:12), str_c("%", strsplit(default, "")[[1]])),
    ALL_1_DIG = list(pat = 1:9, token = c("%e", "%m"))
  )
  return(DATE_REGEXES)
}

# Defines regexes matching time components and the associated strftime tokens 
get_time_regex <- function(){
	TIME_REGEXES <- list(
    AM_PM  = list(c("am", "pm", "AM", "PM"), "%p"),
    MS     = list(c("00", 25:60), c("%M", "%S")),
    HMS    = list(13:24, c("%H", "%M", "%S")),
    IHMS   = list(sprintf("%02d", 1:12), c("%I", "%H", "%M", "%S")),
    I      = list(1:9, "%l")
  )
}
