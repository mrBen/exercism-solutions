function saddlepoints(M)
    saddlepoints = Any[]

    for row in axes(M, 1)
        for column in axes(M, 2)

            saddlepoint = true

            for i in axes(M, 2)
                if M[row, column] < M[row, i]
                    saddlepoint = false
                end
            end

            for i in axes(M, 1)
                if M[row, column] > M[i, column]
                    saddlepoint = false
                end
            end

            if saddlepoint
                push!(saddlepoints, (row, column))
            end

        end
    end

    return saddlepoints
end
