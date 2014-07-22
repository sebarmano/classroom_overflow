require 'rails_helper'

RSpec.describe Answer, :type => :model do
	let(:answer) { subject }

	before { expect(answer).not_to be_valid }

	it 'validates presence of content' do
		expect(answer.errors).to have_key(:content)
	end

	it 'validates presence of question_id' do
		expect(answer.errors).to have_key(:question_id)
	end
end