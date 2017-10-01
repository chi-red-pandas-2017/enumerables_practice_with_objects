require_relative './student_report'
require_relative './student_data_manager'

# getStudentData is defined in data.rb

students = StudentDataManager.load_students
report = StudentReport.new(students: students)

# Driver code for testing all the methods

# work on the gpa method in student.rb first!
puts "GPA"
puts students.first.gpa

# There are 30 total students
puts "Student Count"
puts report.student_count

puts "Valedictorian"
puts report.valedictorian

puts "Salutatorian"
puts report.salutatorian

puts "Top Five"
puts report.top_five

puts "Stuggling Students"
puts report.stuggling_students

puts "Student at rank 10"
puts report.student_at_rank(10)

puts "Student at rank 15"
puts report.student_at_rank(15)

report.gpa_report

report.full_report
