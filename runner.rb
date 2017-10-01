require_relative './student_report'
require_relative './student_data_manager'

# getStudentData is defined in data.rb

students = StudentDataManager.load_students
report = StudentReport.new(students: students)

# Driver code for testing all the methods

# work on the gpa method in student.rb first!
puts "GPA of first student"
puts "========================================"
puts students.first.gpa
puts

# There are 30 total students
puts "Student Count"
puts "========================================"
puts report.student_count
puts

puts "Valedictorian"
puts "========================================"
puts report.valedictorian
puts

puts "Salutatorian"
puts "========================================"
puts report.salutatorian
puts

puts "Top 10"
puts "========================================"
puts report.top_ten
puts

puts "Stuggling Students"
puts "========================================"
puts report.stuggling_students
puts

puts "Student at rank 10"
puts "========================================"
puts report.student_at_rank(10)
puts

puts "Student at rank 15"
puts "========================================"
puts report.student_at_rank(15)
puts

puts
report.gpa_report
puts

puts
report.full_report
puts
