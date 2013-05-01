class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_applicant
    @current_applicant ||= Applicant.find(session[:applicant_id]) if session[:applicant_id]
  end

  def current_period
    @current_period = Period.current_period.first
  end

  def check_period
    redirect_to root_path, alert: "Not application period" unless current_period
  end

  def authenticate_admin
    unless current_admin_user
      flash[:alert] = "Unauthorized access"
      redirect_to root_path
    end
  end

  helper_method :current_applicant, :current_period, :check_period
end
