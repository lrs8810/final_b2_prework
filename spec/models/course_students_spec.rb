require 'rails_helper'

describe CourseStudent, type: :model do
  describe 'validations' do
    it { should validate_presence_of :grade }
  end

  describe 'relationships' do
    it { should belong_to :course }
    it { should belong_to :student }
  end

  describe 'attributes' do
    it 'has a grade' do
      student = Student.create(name: "Laura")
      course = Course.create(name: "Biology")
      course_student = course.course_students.create(grade: 89.5)
      student.course_students << course_student

      expect(course_student.grade).to eq(89.5)
    end
  end
end
