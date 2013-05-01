class ApplicantsController < ApplicationController

  before_filter :check_period

  def new
    if current_applicant
      redirect_to edit_application_form_path(current_applicant.application_form)
    end
    @applicant = Applicant.new
  end

  def create
    applicant = Applicant.new(params[:applicant])
    applicant.period = current_period
    if applicant.save
      applicant.create_application_form
      session[:user_id] = applicant.id
      redirect_to new_application_form_path
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

end
