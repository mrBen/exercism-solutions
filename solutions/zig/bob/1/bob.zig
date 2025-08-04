pub fn response(s: []const u8) []const u8 {
    if (s.len == 0)
        return "Fine. Be that way!";

    var question = false;
    var shouting = true;
    var text = false;
    var silence = true;
    for (s) |c| {
        switch (c) {
            'a'...'z' => {
                shouting = false;
                text = true;
                silence = false;
                question = false;
            },
            'A'...'Z' => {
                text = true;
                silence = false;
                question = false;
            },
            ' ', '\t', '\n', '\r' => continue,
            '?' => question = true,
            else => {
                silence = false;
                question = false;
            },
        }
    }

    if (silence)
        return "Fine. Be that way!";
    if (question and shouting and text)
        return "Calm down, I know what I'm doing!";
    if (question)
        return "Sure.";
    if (shouting and text)
        return "Whoa, chill out!";

    return "Whatever.";
}
