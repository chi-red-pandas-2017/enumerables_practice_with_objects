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
  # input: n/a
  # #   1. Rank students by GPA by descending order (sort)
  #     2. Find top 10 ranked students (select - many)
  #     3. Return their names
  #     output: list of student names array

  def top_ten
    student_and_gpa = students.sort_by {|student| student.gpa}
    s_map = student_and_gpa[-10..-1].map do |student|
      student.name
    end
    s_map.reverse
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
    #student_and_gpa = students.sort_by {|student| student.gpa}
    # s_select = student_and_gpa.select { |student| student.gpa < 2.5 }
    s_select = students.select { |student| student.gpa < 2.5 }
    p s_select.map {|student| student.name}
  end

  # returns the name of the student at the specific numerical rank
  # if the rank is out of bounds, raise an error "Rank not found"
  def student_at_rank(rank)
    student_and_gpa = students.sort_by {|student| student.gpa}
    student_object_at_rank = student_and_gpa.reverse[rank - 1]
    # student_object_at_rank.name
    if rank > student_and_gpa.length - 1
      puts " Rank not found"
    else
      student_object_at_rank.name
    end
  end

  # given a student name, return their class rank (1 based!)
  # if the student is not found, raise an error "Student not found"
  def rank_for_student(name)
    s = students.find {|student| student.name == name }
    students_and_gpa = students.sort_by {|student| student.gpa}
    final_array = students_and_gpa.reverse
    final_array.index(s) + 1
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
