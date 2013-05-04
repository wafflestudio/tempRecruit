class AnswersController < ApplicationController
  
  before_filter :authenticate_applicant!

  respond_to :json

  def create
    @answer = Answer.new(params[:answer])
    @answer.applicant = current_applicant
    @answer.application_form = current_applicant.application_form
    @answer.save
    redirect_to edit_application_form_path(@answer.application_form)

    respond_to do |format|
      format.json { render json: @answer } 
    end

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @tweets }
#    end
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.applicant = current_applicant
    @answer.application_form = current_applicant.application_form
    @answer.update_attributes(content: params[:answer][:content])
    redirect_to edit_application_form_path(@answer.application_form)
  end
end
