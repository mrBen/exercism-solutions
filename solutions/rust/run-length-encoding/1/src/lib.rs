pub fn encode(original: &str) -> String {
    let mut compressed = String::new();
    let mut original = original.chars();

    if let Some(mut value) = original.next() {  // if original is not empty
        let mut count = 1;                   // initialize value and count

        for chr in original {
            if chr == value {
                count += 1;
            } else {  // if value change insert compressed data
                if count > 1 { compressed.push_str(&count.to_string()); }
                compressed.push(value);
                value = chr; count = 1;  // and reset value and count
            }
        }

        if count > 1 { compressed.push_str(&count.to_string()); }
        compressed.push(value);  // instert last bit of compressed data
    }

    compressed
}

pub fn decode(compressed: &str) -> String {
    let mut original = String::new();

    let mut count = String::new();
    for chr in compressed.chars() {
        if chr.is_numeric() {
            count.push(chr);  // concatenation of chars while they are numeric
        } else {
            if let Ok(count) = i32::from_str_radix(&count, 10) {  // if count can be parse
                for _ in 0..count {
                    original.push(chr);  // add n chr to the result (where n is count)
                }
            } else {
                original.push(chr);  // else just add one
            }
            count = String::new();  // don't forget to reset count ;-)
        }
    }

    original
}