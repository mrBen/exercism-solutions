if (.series | length) == 0 then "series cannot be empty" | halt_error
elif .sliceLength == 0 then "slice length cannot be zero" | halt_error
elif .sliceLength < 0 then "slice length cannot be negative" | halt_error
elif (.series | length) < .sliceLength then "slice length cannot be greater than series length" | halt_error
else
  [ {
      start: range((.series | length) - .sliceLength + 1),
      series: .series,
      sliceLength: .sliceLength
    }
  | .series[.start:.start + .sliceLength]]
end
