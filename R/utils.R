#' Constructs a regex union based on a vector of values
#'
#' @keywords internal
#'
join_regex <- function(...){  
  regex <- paste(..., collapse = "|")
  paste("\\b(", regex, ")\\b", sep = "")
}

#' Vectorized version of the switch statement
vec_switch <- function(...) {
  mapply(switch, ..., USE.NAMES = FALSE)
}

#' Binary operator useful for function composition
#'
`%oo%` <- function(x, f){
  f(x)
}

#' Returns strftime tokens already matched in a given string
#'
tokens_matched <- function(string){
  tokens <- regmatches(string, gregexpr("%[a-zA-Z]", string))[[1]]
  matched <- lapply(tokens, function(token){
    switch(token, `%B` = "%m", `%b` = "%m", `%Y` = "%y", `%d`= c("%d", "%e"), 
      `%H` = c("%H", "%I"), `%p` = "%H", token)
  })
  return(matched %oo% unlist %oo% unique)
}

#' Replaces a regex pattern with a strftime token
#'
pattern_replace <- function(string, regex){
  string  <- unlist(string)
  pat     <- join_regex(regex[[1]])
  tokens <- lapply(string, function(x) {
    setdiff(regex[[2]], tokens_matched(x))
  })
  # replace null tokens with pattern 
  tokens[sapply(tokens, length) == 0] <- pat
  string <- mapply(str_replace, string, ignore.case(pat), tokens)
  return(unique(string))
}

# BUGFIX: ignore.case does not work inside mapply. needs to be fixed.
