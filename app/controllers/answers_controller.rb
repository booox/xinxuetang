class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @answer = Answer.new
  end

  def create
    @task = Task.find(params[:id])
    @answer = Answer.new(answer_params)


  end

  private
    
    def answer_params
      params.require(:answer).permit(:content)
    end
end
