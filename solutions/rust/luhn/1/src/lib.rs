pub fn is_valid(input: &str) -> bool {
    let number = input.replace(" ", "");
    if number.len() <= 1 { return false; }

    let mut sum = 0;
    for (idx, chr) in number.chars().enumerate() {
        if let Ok(n) = chr.to_string().parse::<usize>() {

            sum += if (number.len() - idx) % 2 == 0 {
                if n * 2 > 9 { n * 2 - 9 } else { n * 2 }
            } else {
                n
            };

        } else {
            return false;
        }
    }

    sum % 10 == 0
}