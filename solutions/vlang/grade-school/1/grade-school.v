module main

struct Student {
	name  string
	grade int
}

fn add_student(roster []Student, name string, grade int) []Student {
	for student in roster {
		if student.name == name {
			return roster
		}
	}
	mut new_roster := roster.clone()
	new_roster << Student{name, grade}
	return new_roster
}

fn get_students_in_grade(roster []Student, grade int) []string {
	mut students := []string{}
	for student in roster {
		if student.grade == grade {
			students << student.name
		}
	}
	students.sort()
	return students
}

fn get_all_students(roster []Student) []string {
	mut students := roster.clone()
	students.sort_with_compare(fn (a &Student, b &Student) int {
		if a.grade < b.grade {
			return -1
		} else if a.grade > b.grade {
			return 1
		}
		if a.name < b.name {
			return -1
		} else if a.name > b.name {
			return 1
		}
		return 0
	})
	mut sorted_names := []string{}
	for student in students {
		sorted_names << student.name
	}
	return sorted_names
}

// This is a helper function that should return an
// empty roster (type of your choosing)
fn create_new_roster() []Student {
	return []Student{}
}
