package listops

import ()

type IntList []int
type binFunc func(int, int) int
type predFunc func(int) bool
type unaryFunc func(int) int

func (list IntList) Append(appendThis IntList) IntList {
	for _, i := range appendThis {
		list = append(list, i)
	}
	return list
}

func (list IntList) Concat(args []IntList) IntList {
	for _, i := range args {
		for _, j := range i {
			list = append(list, j)
		}
	}
	return list
}

func (list IntList) Filter(fn predFunc) []int {
	l := []int{}
	for _, i := range list {
		if fn(i) {
			l = append(l, i)
		}
	}
	return l
}

func (list IntList) Foldl(fn binFunc, initial int) int {
	for _, i := range list {
		initial = fn(initial, i)
	}
	return initial
}

func (list IntList) Foldr(fn binFunc, initial int) int {
	for i := range list {
		initial = fn(initial, list[len(list)-i-1])
	}
	return initial
}

func (list IntList) Length() int {
	return len(list)
}

func (list IntList) Map(fn unaryFunc) IntList {
	for i := range list {
		list[i] = fn(list[i])
	}
	return list
}

func (list IntList) Reverse() IntList {
	l := IntList([]int{})
	for i := range list {
		l = append(l, list[len(list)-i-1])
	}
	return l
}
