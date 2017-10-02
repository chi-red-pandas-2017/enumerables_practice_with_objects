require_relative 'student'
require_relative 'enrollment'

class StudentReport

  attr_reader :students

  def initialize(args = {})
    @students = args[:students] || []
  end

  # returns the total count of students as an integer
  def student_count
    students.length
  end

  def students_gpas
    student_gpa_hash = {}
    students.each { |student| student_gpa_hash[student.id] = student.gpa}
    student_gpa_hash
  end

  # returns the name of the student at rank 1
  def valedictorian
    high_gpa = students_gpas.values.max
    valedictorian = students.find { |student| student.id == students_gpas.invert[high_gpa] }
    [valedictorian.name, valedictorian.gpa]
  end

  # returns the name of the student at rank 2
  def salutatorian
    salutorian_gpa = students_gpas.values.sort[-2]
    salutatorian = students.find { |student| student.gpa == salutorian_gpa }
    [salutatorian.name, salutatorian.gpa]
  end

  # returns an array of student names in ranks 1-10
  def top_ten
    top_ten_gpas = students_gpas.values.sort[-10..-1].reverse
    top_students = []
    top_ten_gpas.each do |gpa|
      student = students.find {|student| student.gpa == gpa}
      top_students << [student.name, gpa]
    end
    top_students
  end

  # returns an array of student names with GPA below 2.5
  def struggling_students
    low_student_gpas = students_gpas.values.select { |gpa| 2.5 > gpa }
    bottom_students = []
    low_student_gpas.each do |gpa|
      student = students.find { |student| student.gpa == gpa }
      bottom_students << student.name
    end
    bottom_students
  end

  # returns the name of the student at the specific numerical rank
  # if the rank is out of bounds, raise an error "Rank not found"
  def student_at_rank(rank)
    if rank < students.length
      all_gpas = students_gpas.values.sort.reverse
      student = students.find { |student| student.gpa == all_gpas[rank-1] }
      return student.name
    else
      raise "Rank Not Found"
    end
  end

  # given a student name, return their class rank (1 based!)
  # if the student is not found, raise an error "Student not found"
  def rank_for_student(name)
    student = students.find { |student| student.name == name }
    all_gpas = students_gpas.values.sort.reverse
    rank = all_gpas.index(student.gpa) + 1
    rank
  end

=begin
    prints a report of the format as shown below
    Students should be ordered by name alphabetically

    Student Name      GPA
    ============      ===============
    student 1         3.6
    student 2         1.2
    student 3         2.5
=end
  def gpa_report

  end

=begin
    Prints the following:

    STUDENT REPORT
    ==============

    Valedictorian: <student name>
    Salutatorian: <student name>

    Top Ten: <student1>, <student2>... <student10>

    Struggling Students: <student1>... <studentX>

    Full GPA Report:

    Student Name      GPA
    ============      ===============
    student 1         3.6
    student 2         1.2
    student 3         2.5
=end
  def full_report

  end

end
