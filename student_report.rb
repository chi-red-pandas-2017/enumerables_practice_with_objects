class StudentReport

  attr_reader :students

  def initialize(args = {})
    @students = args[:students] || []
  end

  # returns the total count of students as an integer
  def student_count

  end

  # returns the name of the student at rank 1
  def valedictorian

  end

  # returns the name of the student at rank 2
  def salutatorian

  end

  # returns an array of student names in ranks 1-10
  def top_five

  end

  # returns an array of student names with GPA below 2.5
  def stuggling_students

  end

  # returns the name of the student at the specific numerical rank
  # if the rank is out of bounds, throw an error "Rank not found"
  def student_at_rank(rank)

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
