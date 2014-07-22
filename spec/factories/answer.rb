FactoryGirl.define do
	factory :answer do
		sequence (:content) {|n| "Content for answer #{n}"}
		content 'Content'
		question
	end
end