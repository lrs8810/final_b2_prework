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
end
