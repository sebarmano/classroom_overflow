class Answer < ActiveRecord::Base
	validates :content, :question_id, presence: true
end
