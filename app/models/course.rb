class Course < ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students

  validates_presence_of :name

  def students_by_highest_grade
    students.joins(:course_students).select('course_students.grade, students.*').order('course_students.grade desc')
  end
end
