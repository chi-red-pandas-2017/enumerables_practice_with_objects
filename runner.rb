require_relative './student_report'
require_relative './student_data_manager'
require_relative './student'

# getStudentData is defined in data.rb

students = StudentDataManager.load_students
report = StudentReport.new(students: students)

# students.first.convert_grade_to_numbers

# Driver code for testing all the methods
# # work on the gpa method in student.rb first!
puts "GPA of first student"
puts "========================================"
puts students.first.gpa
puts

# # There are 100 total students
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

puts "Struggling Students"
puts "========================================"
puts report.struggling_students
puts

puts "Student at rank 10"
puts "========================================"
puts report.student_at_rank(10)
puts

puts "Student at rank 15"
puts "========================================"
puts report.student_at_rank(15)
puts

puts "Student at unknown position"
puts "========================================"
begin
  report.student_at_rank(150)
rescue Exception => e
  puts e.message
end
puts

puts "Rank for Joey Tribbiani"
puts "========================================"
puts report.rank_for_student("Joey Tribbiani")
puts

puts "Rank for Ted Mosby"
puts "========================================"
puts report.rank_for_student("Ted Mosby")
puts

# puts "Rank for unknown student"
# puts "========================================"
# begin
#   report.rank_for_student("Buffy Summers")
# rescue Exception => e
#   puts e.message
# end
# puts

# puts
# report.gpa_report
# puts

# puts
# report.full_report
# puts
