FactoryGirl.define do
	factory :question do
		sequence (:title) {|n| "Title #{n}"}
		content 'Content'	

		factory :question_with_answers do
			ignore do
	        answers_count 2
	    end

	    after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question)
      end
    end
	end
end