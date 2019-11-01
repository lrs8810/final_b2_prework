require 'rails_helper'

describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:students).through(:course_students) }
  end

  describe 'attributes' do
    it 'has a name' do
      student = Student.create(name: "Laura")

      expect(student.name).to eq("Laura")
    end
  end

  describe 'instance methods' do
    it 'students_by_highest_grade' do
      biology = Course.create(name: 'Biology')
      laura = Student.create(name: 'Laura')
      meg = Student.create(name: 'Meg')
      mike = Student.create(name: 'Mike')
      laura_grade = laura.course_students.create(grade: 75.0)
      meg_grade = meg.course_students.create(grade: 94.5)
      mike_grade = mike.course_students.create(grade: 89.0)

      biology.course_students.push(laura_grade, meg_grade, mike_grade)

      student_names = biology.students_by_highest_grade.map(&:name)

      expect(student_names).to eq([meg.name, mike.name, laura.name])
    end
  end
end
