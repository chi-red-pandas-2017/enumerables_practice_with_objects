require 'csv'
require 'faker'
require_relative 'student'
require_relative 'enrollment'

module StudentDataManager

  # 38 possible courses
  COURSES = ["Bio 101", "Bio 102", "Bio 103", "Bio 104", "Chem 101", "Chem 102", "Chem 103",
             "Chem 104", "Eng 101", "Eng 102", "Eng 103", "Eng 104", "MA 101", "MA 102",
             "MA 103", "MA 104", "Span 101", "Span 102", "Span 103", "Span 104", "Hist 101",
             "Hist 102", "Hist 103", "Hist 104", "PSY 101", "PSY 102", "PSY 103", "PSY 104",
             "Phys 101", "Phys 102", "Phys 103", "Phys 104", "CS 101", "CS 102", "CS 103",
             "CS 104", "Art 101", "Art 102", "Art 103", "Art 104"]

  GRADES = ["A", "B", "C", "A", "B", "C", "D", "F"]

  CREDITS = [3, 4, 5]

  def self.load_students
    students = []
    CSV.foreach('data/students.csv', headers: true, header_converters: :symbol, converters: :all) do |student|
      students << Student.new(student)
    end

    CSV.foreach('data/enrollments.csv', headers: true, header_converters: :symbol, converters: :all) do |enrollment|

      student = students.find { |student| student.id == enrollment[:student_id]}
      student.enrollments << Enrollment.new(enrollment)
    end

    students
  end

  # main method to redo all of the csv files if you want
  def self.create_data(number_of_students)
    students_creator(number_of_students)
    enrollments_creator(number_of_students)
  end

  # Use this if you want to create different student data
  def self.students_creator(number_of_students)
    CSV.open('data/students.csv', 'wb') do |csv|
      students = getStudents(number_of_students)
      csv << ["id", "name"]

      students.each_with_index do |student_name, student_id|
        csv << [student_id + 1, student_name]
      end
    end
  end

  def self.getStudents(number_of_students)
    students = []
    until students.length == number_of_students
      name_to_add = [Faker::HowIMetYourMother.character, Faker::StarWars.character, Faker::StarTrek.character, Faker::Simpsons.character, Faker::RickAndMorty.character, Faker::HarryPotter.character, Faker::Friends.character, Faker::FamilyGuy.character].sample
      next unless name_to_add.include?(" ")
      next if name_to_add.include?(".") || name_to_add.include?("'") || name_to_add.include?("\"") || name_to_add.include?(",") || name_to_add.include?("(")
      students << name_to_add unless students.include?(name_to_add)
    end
    students
  end

  # Use this if you want to create different enrollment data
  def self.enrollments_creator(number_of_students)
    CSV.open('data/enrollments.csv', 'wb') do |csv|
      csv << ["student_id", "course_name", "number_of_credits", "letter_grade"]

      number_of_students.times do |student_id|
        number_of_courses = rand(20..30)

        courses = COURSES.sample(number_of_courses)

        courses.each do |course|
          csv << [student_id + 1, course, CREDITS.sample, GRADES.sample]
        end
      end
    end
  end
end

p StudentDataManager.load_students
