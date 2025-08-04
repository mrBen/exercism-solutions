function largest_product(str, span)
    if span > length(str)
        throw(ArgumentError("span longer than string length"))
    end
    for n in str
        if !('0' <= n <= '9')
            throw(ArgumentError("invalid character in digits"))
        end
    end
    if span < 0
        throw(ArgumentError("negative span"))
    end
    largest = 0
    for i in 0:length(str)-span
        product = 1
        for j in 1:span
            product *= codeunit(str, i+j) - codeunit("0", 1)
        end
        if product > largest
            largest = product
        end
    end
    return largest
end
