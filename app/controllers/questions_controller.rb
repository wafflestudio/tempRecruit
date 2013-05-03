class QuestionsController < ApplicationController
  before_filter :authenticate_admin_user!

  def create
    raise
    unless current_period
      flash[:alert] = "Not an Application period"
      redirect_to admin_root_path
    end

    question = Question.new(params[:question])
    question.period = current_period
    if question.save
      redirect_to admin_questions_path, notice: "Question Successfully Added"
    else
      render new_admin_question_path
    end
    
  end

  def update

  end


end
