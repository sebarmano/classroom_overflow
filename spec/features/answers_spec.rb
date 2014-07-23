require 'rails_helper'

feature 'Answer questions' do
	scenario 'when a question is showed' do
		question = create(:question)
		visit question_path(question)

		fill_in 'Content', with: 'Answer content'
		click_button 'Submit'
		answer = Answer.where(question_id: question.id ).first
		expect(page).to have_content(answer.content)
	end
end