let leap_year year =
  match year mod 4 with
  | 0 -> (
      match year mod 100 with
      | 0 -> ( match year mod 400 with 0 -> true | _ -> false)
      | _ -> true)
  | _ -> false
