module main

pub fn find(array []int, value int) !int {
    match array.len {
        0 { return error('value not in array') }
        1 {
            if array[0] == value {
                return 0
            } else {
                return error('value not in array')
            }
        }
        else {
            mid := array.len / 2
            if value < array[mid] {
                return find(array[..mid], value)
            } else if value > array[mid] {
                return mid + find(array[mid..], value) or { return err }
            } else {
                return mid
            }
        }
    }
}
