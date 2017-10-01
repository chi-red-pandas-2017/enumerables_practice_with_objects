class Student
  attr_reader :id, :name, :enrollments

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
  end
end
