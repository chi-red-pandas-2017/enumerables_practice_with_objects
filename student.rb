class Student
  attr_reader :id, :name, :enrollments

  GRADES = { "A" => 4.00, "B" => 3.00, "C" => 2.00, "D" => 1.00, "F" => 0.00 }

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @enrollments = args[:enrollments] || []
  end

=begin
  this method will take the enrollments object array and determine a gpa
  GPA is calculated as follows:
  4 * course credit hours for each A
  3 * course credit hours points for each B
  2 * course credit hours points for each C
  1 * course credit hours point for each D
  0 * course credit hours for each F
  GPA = The total number of course points divided by total number of credits
  the result should be a floating point number
=end
  def gpa
    # convert_grade_to_numbers
    aggregate_scores / total_credit_hours
  end

private

  def aggregate_scores
    enrollment_points.reduce(:+)
  end

  def enrollment_points
    enrollments.map{|enrollment| enrollment.number_of_credits * GRADES[enrollment.letter_grade] }
  end

  def total_credit_hours
    enrollments.reduce(0) { |sum, enrollment| sum + enrollment.number_of_credits}
  end

end
