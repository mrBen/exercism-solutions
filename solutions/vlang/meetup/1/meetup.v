module main

import time

fn date(phrase string) string {
    mut parts := phrase.trim_string_left('The ').split(' of ')
    month, year := parse_date(parts[1]) or { panic(err) }

    mut target := 0
    mut day := 0
    if parts[0].ends_with('teenth') {
        target = parse_day(parts[0]) or { panic(err) }
        day = 13
    } else {
        parts = parts[0].split(' ')
        target = parse_day(parts[1]) or { panic(err) }
        day = match parts[0] {
            'first' { 1 }
            'second' { 8 }
            'third' { 15 }
            'fourth' { 22 }
            else { nb_day_in_month(month, year) - 6 }
        }
    }

    for time.day_of_week(year, month, day) != target {
        day++
    }
    return '${year}/${month}/${day}'
}

fn parse_day(day string) !int {
    return match day.to_lower()[..3] {
        'mon' { 1 }
        'tue' { 2 }
        'wed' { 3 }
        'thu' { 4 }
        'fri' { 5 }
        'sat' { 6 }
        'sun' { 7 }
        else { error('could not parse day') }
    }
}

fn parse_date(date string) !(int, int) {
    parts := date.split(' ')
    month := match parts[0] {
        'January' { 1 }
        'February' { 2 }
        'March' { 3 }
        'April' { 4 }
        'May' { 5 }
        'June' { 6 }
        'July' { 7 }
        'August' { 8 }
        'September' { 9 }
        'October' { 10 }
        'November' { 11 }
        'December' { 12 }
        else { return error('could not parse date') }
    }
    return month, parts[1].int()
}

fn nb_day_in_month(month int, year int) int {
    return match month {
        2 {
            if year % 4 != 0 {
                28
            } else {
                29
            }
        }
        4, 6, 9, 11 { 30 }
        else { 31 }
    }
}