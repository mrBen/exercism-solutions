if test("[^0-9 ]"; "g") then false
else
    sub("[^0-9]"; ""; "g")
  | if length <= 1 then false
    else [
        split("")
      | reverse
      | map(tonumber)
      | to_entries | .[]
      | if .key % 2 != 0 then (.value * 2)
        else .value
        end
      | if . > 9 then . - 9
        else .
        end
      ] | add | . % 10 == 0
    end
end
