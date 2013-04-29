class ApplicationController < ActionController::Base
  protect_from_forgery


  def current_applicant
    @current_applicant ||= Applicant.find(session[:applicant_id]) if session[:applicant_id]
  end

end
