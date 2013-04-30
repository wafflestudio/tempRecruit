class SessionsController < ApplicationController
  def new
    if current_applicant
      redirect_to edit_application_form_path(current_applicant.application_form)
    end
  end

  def create
    applicant = Applicant.find_by_email(params[:session][:email])
    if applicant && applicant.authenticate(params[:session][:password])
      session[:user_id] = applicant.id
      redirect_to edit_application_form_path(applicant.application_form)
    else
      render :new, :alert => "Invalid login credentials"
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
