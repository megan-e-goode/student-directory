# let's put all the students into an array
=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "Please enter a cohort to display: "
  cohort_selected = gets.chomp

  students.sort_by! { |student| student[:cohort]}
  students.select! { |student| student[:cohort] == cohort_selected }

  students.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{
      student[:cohort]} cohort), Hobby: #{
      student[:hobby]}, Country of Birth: #{student[:cob]}".center(100)
  end
end

def print_footer(names)
  names.count > 1 ? plural = "students" : plural = "student"
  puts "Overall, we have #{names.count} great #{plural}"
end

def input_students()
  puts "To finish, just return twice"
  puts "Please enter the name of the student"
  name = gets.gsub("\n", "")

  students = []

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the cohort month"
    cohort = gets.chomp
    cohort = :november unless !cohort.empty?

    students << { name: name, cohort: cohort.to_s , hobby: "n/a", cob: "England"}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the name of the student"
    name = gets.chomp
  end
  # return the array of students
  students
end

# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
