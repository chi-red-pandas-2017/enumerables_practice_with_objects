class Enrollment
  attr_reader :student_id, :course_name, :number_of_credits, :letter_grade

  def initialize(args = {})
    @student_id = args[:student_id]
    @course_name = args[:course_name]
    @number_of_credits = args[:number_of_credits]
    @letter_grade = args[:letter_grade]
  end
end
