pub fn raindrops(nb: i32) -> String {
    let mut res = "".to_string();

    if nb % 3 == 0 {
        res += "Pling";
    }
    if nb % 5 == 0 {
        res += "Plang";
    }
    if nb % 7 == 0 {
        res += "Plong";
    }

    if res == "" {
        res += &(nb.to_string());
    }

    res
}