let square_of_sum n =
  let rec sum = function 0 -> 0 | n -> n + sum (n - 1) in
  sum n * sum n

let rec sum_of_squares = function
  | 0 -> 0
  | n -> (n * n) + sum_of_squares (n - 1)

let difference_of_squares n = square_of_sum n - sum_of_squares n
