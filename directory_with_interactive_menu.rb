@students = [] # Available to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv."
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # Will exit the program
    else
      puts "I don't know what you meant, try again."
  end
end

def interavtive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.sort_by! { |student| student[:cohort]}

  @students.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{
      student[:cohort]} cohort), Hobby: #{
      student[:hobby]}, Country of Birth: #{student[:cob]}".center(100)
  end
end

def print_footer
  @students.count > 1 ? plural = "students" : plural = "student"
  puts "Overall, we have #{@students.count} great #{plural}"
end

def input_students
  puts "To finish, just return twice"
  puts "Please enter the name of the student"
  name = STDIN.gets.gsub("\n", "")

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the cohort month"
    cohort = STDIN.gets.chomp
    cohort = :november unless !cohort.empty?

    @students << { name: name, cohort: cohort.to_s , hobby: "n/a", cob: "England"}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Please enter the name of the student"
    name = STDIN.gets.chomp
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exsists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exsist
    puts "Sorry, #{filename} does not exist."
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

try_load_students
interavtive_menu
