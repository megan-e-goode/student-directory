def interavtive_menu
    students = []

  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items

    selection = gets.chomp

    case selection
      when "1"
        # Input students
        students = input_students
      when "2"
        # Show students
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # Will exit the program
        break
      else
        puts "I don't know what you meant, try again."
    end
  end
end

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

interavtive_menu
