pub fn sum_of_multiples(limit: i32, nbs: &Vec<i32>) -> i32 {
    let mut sum = 0;
    for x in 1..limit {
        for n in nbs {
            if x % n == 0 {
                sum += x;
                break;
            }
        }
    }
    sum
}