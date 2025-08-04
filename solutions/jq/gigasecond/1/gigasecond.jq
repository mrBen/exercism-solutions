  .moment
| if length <= 10 then . + "T00:00:00Z"
  else . + "Z" end
| fromdate | . + 1000000000 | todate
| rtrimstr("Z")
