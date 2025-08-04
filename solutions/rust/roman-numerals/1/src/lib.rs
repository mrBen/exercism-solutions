use std::fmt::{Display, Formatter, Result};

pub struct Roman {
    units: u32,
    tens: u32,
    hundreds: u32,
    thousands: u32 	 	 	
}

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        let units = match self.units {
            1 | 2 | 3 => "I".repeat(self.units as usize),
            4 => "IV".to_string(),
            5 | 6 | 7 | 8 => "V".to_string() + &"I".repeat(self.units as usize - 5),
            9 => "IX".to_string(),
            _ => String::new()
        };
        let tens = match self.tens {
            1 | 2 | 3 => "X".repeat(self.tens as usize),
            4 => "XL".to_string(),
            5 | 6 | 7 | 8 => "L".to_string() + &"X".repeat(self.tens as usize - 5),
            9 => "XC".to_string(),
            _ => String::new()
        };
        let hundreds = match self.hundreds {
            1 | 2 | 3 => "C".repeat(self.hundreds as usize),
            4 => "CD".to_string(),
            5 | 6 | 7 | 8 => "D".to_string() + &"C".repeat(self.hundreds as usize - 5),
            9 => "CM".to_string(),
            _ => String::new()
        };
        let thousands = "M".repeat(self.thousands as usize);
        write!(f, "{}{}{}{}", thousands, hundreds, tens, units);
        Ok(())
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        let units = num % 10;
        let tens = (num % 100) / 10;
        let hundreds = (num % 1000) / 100;
        let thousands = num / 1000;
        Self { units, tens, hundreds, thousands }
    }
}
