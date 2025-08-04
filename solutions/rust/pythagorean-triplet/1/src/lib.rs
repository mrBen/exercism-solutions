pub fn find() -> Option<i32> {
    let mut c: i32;
    
    for a in 1..500 {
        for b in a..500 {
            c = 1000 - a - b;
            
            if a.pow(2) + b.pow(2) == c.pow(2) {
                return Some(a * b * c);
            }
        }
    }
    
    None
}