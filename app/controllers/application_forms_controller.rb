class ApplicationFormsController < ApplicationController

  before_filter :check_period
  before_filter :authenticate_applicant!

#  def new
#  end
  
  def create
  end

  def edit
    @applicant = current_applicant
    @app_form = current_applicant.application_form
    @questions = @app_form.questions
    @answers = []
    @questions.each do |question| 
      ans = @app_form.answers.where("question_id = ?", question.id).first
      @answers.push ans || @app_form.answers.build(question_id: question.id, 
                                            applicant_id: @applicant.id, 
                                            application_form_id: @app_form_id)
    end
  end

  def update

  end


end
