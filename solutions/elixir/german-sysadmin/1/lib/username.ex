defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    case head do
      head when head >= ?a and head <= ?z -> [head]
      ?_ -> [head]
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _ -> []
    end ++ sanitize(tail)
  end
end
