module main

struct LinkedList {
mut:
	data []int
	len int // maintain the number of elements in the list in this field
}

fn new() LinkedList {
    return LinkedList{
        data: []int{}
        len: 0
    }
}

fn from_array(array []int) LinkedList {
    return LinkedList{
        data: array.clone()
        len: array.len
    }
}

fn (list LinkedList) is_empty() bool {
    return list.len == 0
}

fn (mut list LinkedList) push(data int) {
    list.data << data
    list.len += 1
}

fn (mut list LinkedList) pop() ?int {
    if list.is_empty() {
        return none
    }
    v := list.data.last()
    list.len -= 1
    list.data.trim(list.len)
    return v
}

fn (list LinkedList) peek() ?int {
    if list.is_empty() {
        return none
    }
    return list.data.last()
}

fn (list LinkedList) to_array() []int {
    return list.data
}

fn (list LinkedList) reverse() LinkedList {
    return from_array(list.data.reverse())
}
