require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit a student show page' do
    it 'I see the student\'s name, all their courses, and their grade per course' do
      laura = Student.create(name: 'Laura')

      biology = Course.create(name: 'Biology')
      math = Course.create(name: 'Math')
      history = Course.create(name: 'History')

      biology_grade = biology.course_students.create(grade: 89.5)
      math_grade = math.course_students.create(grade: 80.0)
      history_grade = history.course_students.create(grade: 94.0)

      laura.course_students.push(biology_grade, math_grade, history_grade)

      visit "/students/#{laura.id}"

      expect(page).to have_content('Laura')

      within "#course-#{biology.id}" do
        expect(page).to have_content('Biology')
        expect(page).to have_content('Grade: 89.5')
      end

      within "#course-#{math.id}" do
        expect(page).to have_content('Math')
        expect(page).to have_content('Grade: 80.0')
      end

      within "#course-#{history.id}" do
        expect(page).to have_content('History')
        expect(page).to have_content('Grade: 94.0')
      end
    end
  end
end
