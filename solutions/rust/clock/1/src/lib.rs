use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32
}

impl Clock {
    pub fn new(h: i32, m: i32) -> Clock {
        Clock {
            hours: h,
            minutes: m
        }.correct()
    }
    
    pub fn add_minutes(&self, m: i32) -> Clock {
        Clock {
            hours: self.hours,
            minutes: self.minutes + m
        }.correct()
    }
    
    fn correct(&self) -> Clock {
        let mut h = self.hours;
        let mut m = self.minutes;
        
        while m > 59 { m -= 60; h += 1; }
        while m < 0  { m += 60; h -= 1; }
        
        while h > 23 { h -= 24; }
        while h < 0  { h += 24; }
        
        Clock { hours: h, minutes: m }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}