class StudentReport

  attr_reader :students

  def initialize(args = {})
    @students = args[:students] || []
  end

  # returns the total count of students as an integer
  def student_count
    students.length
  end

  # returns the name of the student at rank 1
  def valedictorian
    # get GPA of all students in array and sort
    student_gpas = []
    students.each do |student|
      student_gpas << student.gpa
    end
    rank1_gpa = student_gpas.sort[-1]
    no_one_student = students.find {|student| student.gpa == rank1_gpa }
      no_one_student.name
  end

  # returns the name of the student at rank 2
  def salutatorian
    student_gpas = []
    students.each do |student|
      student_gpas << student.gpa
    end
    rank2_gpa = student_gpas.sort[-2]
    no_two_student = students.find {|student| student.gpa == rank2_gpa }
      no_two_student.name
  end

  # returns an array of student names in ranks 1-10

def top_ten

end


  # def top_ten
  #   student_gpas = []
  #   students.each do |student|
  #     student_gpas << student.gpa
  #   end
  #   top_ten_gpas = student_gpas.sort[-10..-1]
  #   #find the student objects that correspond to the 10 gpas
  #  #create a new array to store student objects
  #  #iterate through students to find the students whose GPA's match the top 10 gpas
  #   p gpas_desc_order = top_ten_gpas.sort.reverse
  #   top_ten_students = []
  #   students.each do |student|
  #     if gpas_desc_order.include?(student.gpa)
  #       top_ten_students << student.name
  #     end
  #   end
  #   p top_ten_students
  # end

  # returns an array of student names with GPA below 2.5
  def struggling_students
  end

  # returns the name of the student at the specific numerical rank
  # if the rank is out of bounds, raise an error "Rank not found"
  def student_at_rank(rank)
  end

  # given a student name, return their class rank (1 based!)
  # if the student is not found, raise an error "Student not found"
  def rank_for_student(name)
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
