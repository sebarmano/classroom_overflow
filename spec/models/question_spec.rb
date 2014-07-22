require 'rails_helper'

RSpec.describe Question, :type => :model do
	let(:question) { subject }

	before { expect(question).not_to be_valid }

	it 'validates presence of title' do
		expect(question.errors).to have_key(:title)
	end

	it 'validates presence of content' do
		expect(question.errors).to have_key(:content)
	end

	it 'has many answers' do
		expect(subject).to have_many(:answers)
	end
end
