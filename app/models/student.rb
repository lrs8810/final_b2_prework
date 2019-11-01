class Student < ApplicationRecord
  has_many :course_students
  has_many :courses, through: :course_students

  validates_presence_of :name

  def course_name_grade
    courses.joins(:course_students).select('course_students.grade, courses.*')
  end
end
