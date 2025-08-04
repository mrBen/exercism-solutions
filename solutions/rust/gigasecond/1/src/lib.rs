extern crate chrono;
use chrono::*;

pub fn after(start: DateTime<UTC>) -> DateTime<UTC> {
    start.checked_add(Duration::seconds(1000000000)).expect("overflow")
}