function sum_of_multiples(limit, factors)
    sum = 0
    for i in 1:limit-1
        is_multiple = false
        for factor in factors
            if factor==0
                continue
            end
            if i % factor == 0
                is_multiple = true
                break
            end
        end
        if is_multiple
            sum += i
        end
    end
    return sum
end
