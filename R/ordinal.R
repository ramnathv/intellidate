#' Converts a number to its ordinal equivalent (e.g. 12 => 12th)
#'
#' This function is a port of the ruby code at http://goo.gl/JTZCm
#' @import operators
#  BUGFIX: ordinal(29) = "" due to bug in switch statement
ordinal <- function(number){
  number <- number %oo% as.character %oo% type.convert
  suffix <- if (number %% 100 %~% paste(11:13, collapse = "|")) {
    'th'
  } else {
    switch(number %% 10 + 1, 'th', 'st', 'nd', 'rd', 'th')             
  }
  sprintf("%d%s", number, suffix)
}

`%~%` <- function (x, rx){
    base:::regexpr(rx, x) > 0 
}


# Original Ruby Code.
# Source: http://goo.gl/JTZCm
# def ordinal(number)
#   if (11..13).include?(number.to_i % 100)
#     "#{number}<span>th</span>"
#   else
#     case number.to_i % 10
#     when 1; "#{number}<span>st</span>"
#     when 2; "#{number}<span>nd</span>"
#     when 3; "#{number}<span>rd</span>"
#     else    "#{number}<span>th</span>"
#     end
#   end
# end