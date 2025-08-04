function wordcount(sentence)
    count = Dict()
    for word in split(sentence, x->!(x=='\''||('0'<=x<='9')||('A'<=x<='Z')||('a'<=x<='z')))
        word = strip(word, '\'')
        if length(word) <= 0
            continue
        end

        if lowercase(word) in keys(count)
            count[lowercase(word)] += 1
        else
            count[lowercase(word)] = 1
        end
    end
    return count
end
