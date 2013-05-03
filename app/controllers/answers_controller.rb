class AnswersController < ApplicationController
  
  before_filter :authenticate_applicant!


  def create
    @answer = Answer.new(params[:answer])
    @answer.applicant = current_applicant
    @answer.application_form = current_applicant.application_form
    @answer.save
    redirect_to edit_application_form_path(@answer.application_form)
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.applicant = current_applicant
    @answer.application_form = current_applicant.application_form
    @answer.update_attributes(content: params[:answer][:content])
    redirect_to edit_application_form_path(@answer.application_form)
  end
end
