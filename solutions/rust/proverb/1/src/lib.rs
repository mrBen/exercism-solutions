pub fn build_proverb(list: Vec<&str>) -> String {
    let mut proverb = String::new();
    
    for i in 1..list.len() {
        let line = format!("For want of a {} the {} was lost.\n",
                           &list[i-1], &list[i]);
        proverb.push_str(line.as_str());
    }
    
    if list.len() > 0 {
        let closing: String;
        if list.len() < 3 {
            closing = format!("And all for the want of a {}.", &list[0]);
        } else {
            closing = format!("And all for the want of a {}{} {}.",
                              &list[2], &list[1], &list[0]);
        }
        proverb.push_str(closing.as_str());
    }
    
    proverb
}