//
// See Rust Language Specific Instructions
// below normal exercise description.
//

pub fn encode(n: u64) -> String {
    if n == 0 {
        String::from("zero")
    } else {
        match n {
            x if x < 100 => say_under_hundred(x),
            x if x < 1000 => break_hundreds(x),
            x => break_thousands(x)
        }
    }
}

fn say_under_hundred(n: u64) -> String {
    match n {
        0 =>  String::new(),
        1 =>  String::from("one"),
        2 =>  String::from("two"),
        3 =>  String::from("three"),
        4 =>  String::from("four"),
        5 =>  String::from("five"),
        6 =>  String::from("six"),
        7 =>  String::from("seven"),
        8 =>  String::from("eight"),
        9 =>  String::from("nine"),
        10 => String::from("ten"),
        11 => String::from("eleven"),
        12 => String::from("twelve"),
        13 => String::from("thirteen"),
        14 => String::from("fourteen"),
        15 => String::from("fifteen"),
        16 => String::from("sixteen"),
        17 => String::from("seventeen"),
        18 => String::from("eighteen"),
        19 => String::from("nineteen"),
        
        x if x < 100 => {
                let quo = n / 10; let rem = n % 10;
                
                let tens = match quo {
                        2 => String::from("twenty"),
                        3 => String::from("thirty"),
                        4 => String::from("forty"),
                        5 => String::from("fifty"),
                        6 => String::from("sixty"),
                        7 => String::from("seventy"),
                        8 => String::from("eighty"),
                        9 => String::from("ninety"),
                        _ => String::new()
                    };
                let units = if rem != 0 {
                                String::from("-") + &say_under_hundred(rem)
                            } else {
                                String::new()
                            };
                
                tens + &units
            },
        
        _ => String::new()
    }
}

fn break_hundreds(n: u64) -> String {
    let quo = n / 100; let rem = n % 100;
    
    let hundreds = say_under_hundred(quo) + " hundred";
    let tens = if rem != 0 {
                   String::from(" ") + &say_under_hundred(rem)
               } else {
                   String::new()
               };
    
    hundreds + &tens
}

fn break_thousands(mut n: u64) -> String {
    let mut chunks = Vec::new();
    while n > 0 {
        chunks.push(n % 1000);
        n /= 1000;
    }
    
    let mut spelling = String::new();
    for (i, chunk) in chunks.into_iter().enumerate() {
        if chunk > 0 {
            let name = match i {
                    1 => String::from(" thousand"),
                    2 => String::from(" million"),
                    3 => String::from(" billion"),
                    4 => String::from(" trillion"),
                    5 => String::from(" quadrillion"),
                    6 => String::from(" quintillion"),
                    _ => String::new()
                };
            let previous_spelling = if spelling == String::new() {
                                        String::new()
                                    } else {
                                        String::from(" ") + &spelling
                                    };
            spelling = encode(chunk) + &name + &previous_spelling;
        }   
    }
    
    spelling
}