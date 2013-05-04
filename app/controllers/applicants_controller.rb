class ApplicantsController < ApplicationController

  before_filter :check_period
  before_filter :authenticate_admin_user!, only: [:mark_as_complete]

  def new
    if current_applicant
      redirect_to edit_application_form_path(current_applicant.application_form)
    else
      @applicant = Applicant.new
    end
  end

  def create
    @applicant = Applicant.new(params[:applicant])
    @applicant.period = current_period
    if @applicant.save
      @applicant.create_application_form(period_id: current_period.id)
      session[:applicant_id] = @applicant.id
      redirect_to edit_application_form_path(@applicant.application_form)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def mark_as_complete
    applicant = Applicant.find(params[:id])
    applicant.complete!
    applicant.save
    redirect_to admin_applicants_path, notice: "Applicant Status Successfully changed"
  end

end
