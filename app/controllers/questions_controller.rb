class QuestionsController < ApplicationController
	respond_to :html
	def index
		@questions = Question.all
		respond_with @questions
	end

	def new
		@question = Question.new
		respond_with @question
	end

	def create
		@question = Question.new(question_params)

		@question.save
		flash[:notice] = 'Question added successfully'
		respond_with @question, location: questions_path
	end

	def show
		@question = Question.find(params[:id])
		@answer = @question.answers.build
	end

	private
	def question_params
		params.require(:question).permit(:title, :content)
	end
end