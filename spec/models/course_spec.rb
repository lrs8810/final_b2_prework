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
end
