require 'rails_helper'

describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:courses).through(:course_students) }
  end

  describe 'attributes' do
    it 'has a name' do
      course = Course.create(name: "Biology")

      expect(course.name).to eq("Biology")
    end
  end

  describe 'instance methods' do
    it 'course_name_grade' do
      laura = Student.create(name: 'Laura')

      biology = Course.create(name: 'Biology')
      math = Course.create(name: 'Math')
      history = Course.create(name: 'History')

      biology_grade = biology.course_students.create(grade: 89.5)
      math_grade = math.course_students.create(grade: 80.0)
      history_grade = history.course_students.create(grade: 94.0)

      laura.course_students.push(biology_grade, math_grade, history_grade)

      grades = laura.course_name_grade.map(&:grade)
      courses = laura.course_name_grade.map(&:name)

      expect(grades).to eq([89.5, 80.0, 94.0])
      expect(courses).to eq(["Biology", "Math", "History"])
    end
  end
end
