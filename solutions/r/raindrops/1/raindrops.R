raindrops <- function(number) {
  sound <- ""
  if (number %% 3 == 0) {
    sound <- paste(sound, "Pling", sep="")
  }
  if (number %% 5 == 0) {
    sound <- paste(sound, "Plang", sep="")
  }
  if (number %% 7 == 0) {
    sound <- paste(sound, "Plong", sep="")
  }
  if (nchar(sound) == 0) {
    sound <- sprintf("%d", number)
  }
  return(sound)
}
