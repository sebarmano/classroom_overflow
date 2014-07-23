class AnswersController < ApplicationController
	
	respond_to :html

	def create
		@answer = Answer.new(answer_params)
		@answer.save
		respond_with @answer, location: question_path(@answer.question)
	end

	private

	def answer_params
		params.require(:answer).permit(:content, :question_id)
	end
end