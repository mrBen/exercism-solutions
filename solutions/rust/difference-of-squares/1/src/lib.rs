pub fn square_of_sum(n: i32) -> i32 {
    let mut res = 0;
    for i in 0..n {
        res += i + 1
    }
    res * res
}

pub fn sum_of_squares(n: i32) -> i32 {
    let mut res = 0;
    for i in 0..n {
        res += (i + 1) * (i + 1)
    }
    res
}

pub fn difference(n: i32) -> i32 {
    square_of_sum(n) - sum_of_squares(n)
}