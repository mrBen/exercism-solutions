defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    case head do
      c when c >= ?a and c <= ?z -> [c]
      ?_ -> ~c"_"
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _ -> []
    end ++ sanitize(tail)
  end
end
