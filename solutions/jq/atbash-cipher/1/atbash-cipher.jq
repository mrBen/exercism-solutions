{
    text:
        .input.phrase
        | sub("[^A-Za-z0-9]"; ""; "g")
        | explode
        | map(
            if (. >= 65) and (. <= 90) then 90 - . + 97
            elif (. >= 97) and (. <= 122) then 122 - . + 97
            else . end)
        | implode,
    mode:
        .property
}
| if .mode == "encode" then .text | sub("(?<x>.{5})"; "\(.x) "; "g") | rtrimstr(" ")
  else .text end
