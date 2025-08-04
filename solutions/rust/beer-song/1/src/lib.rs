pub fn verse(mut n: i32) -> String {
    let mut v = bottles(&n).replace("no", "No") + " of beer on the wall, " + &bottles(&n) + " of beer.\n";

    if n == 0 {
        v = v + "Go to the store and buy some more, ";
        n = 99;
    } else {
        v = v + "Take " + if n == 1 {"it"} else {"one"} + " down and pass it around, ";
        n -= 1;
    }
    v + &bottles(&n) + " of beer on the wall.\n"
}

fn bottles(n: &i32) -> String {
    let s = match *n {
        0 => "no more".to_string(),
        n => n.to_string()
    };
    s + " bottle" + if *n == 1 {""} else {"s"}
}

pub fn sing(mut big: i32, small: i32) -> String {
    let mut s = String::new();
    while big > small {
        s = s + &verse(big) + "\n";
        big -= 1;
    }
    s + &verse(small)
}