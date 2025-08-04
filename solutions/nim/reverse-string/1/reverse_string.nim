proc reverse*(s: string): string =
  var rev: string = ""
  for i in 0..len(s)-1:
    rev.add(s[len(s) - i - 1])
  return rev
