require 'rails_helper'

feature 'Manage questions' do
	scenario 'when two questions exist' do
		questions = create_list(:question, 2)
		visit questions_path
		expect(page).to have_content('Title 1')
		expect(page).to have_content('Title 2')
	end

	scenario "allows user to add a new question" do
		question = build(:question)
		visit new_question_path
		fill_in 'Title', with: question.title
		fill_in 'Content', with:  question.content
		click_button 'Submit'

		expect(page).to have_content(question.title)
	end
end

feature 'Show a question and its answers' do
	scenario 'when a question has no answers' do
		question = create(:question)
		visit question_path(question)
		
		expect(page).to have_content(question.title)
		expect(page).to have_content(question.content)
		expect(page).to have_content("There are no answers for this question.")	
		expect(page).to have_content('Content') # Ask how to test that there is a form in the page
	end

	scenario 'when a question has two answers' do
		question = create(:question_with_answers)
		visit question_path(question)

		expect(page).to have_content(question.title)
		expect(page).to have_content(question.content)
		expect(page).to have_content(question.answers.first.content)
		expect(page).not_to have_content("There are no answers for this question.")	
		expect(page).to have_content('Content') 
	end
end
