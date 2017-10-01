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
  4 points for each A
  3 points for each B
  2 points for each C
  1 point for each D
  0 for each F
  The total number of points divided by
  total number of credits
  the result should be a floating point number
=end
  def gpa


  end
end
