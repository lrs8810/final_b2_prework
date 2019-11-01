require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit a course show page' do
    it 'I see the course name and all students in the course ordered from highest to lowest grade' do
      biology = Course.create(name: 'Biology')
      laura = Student.create(name: 'Laura')
      meg = Student.create(name: 'Meg')
      mike = Student.create(name: 'Mike')
      laura_grade = laura.course_students.create(grade: 75.0)
      meg_grade = meg.course_students.create(grade: 94.5)
      mike_grade = mike.course_students.create(grade: 89.0)

      biology.course_students.push(laura_grade, meg_grade, mike_grade)

      visit "/courses/#{biology.id}"
    
      expect(page).to have_content('Biology')

      expect(page.find_all('.students')[0]).to have_content('Meg')
      expect(page.find_all('.students')[1]).to have_content('Mike')
      expect(page.find_all('.students')[2]).to have_content('Laura')
    end
  end
end
