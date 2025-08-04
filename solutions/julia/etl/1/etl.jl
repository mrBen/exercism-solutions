function transform(input::AbstractDict)
    new = Dict()
    for (point, letters) in input
        for letter in letters
            new[lowercase(letter)] = point
        end
    end
    return new
end
