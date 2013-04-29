class HomeController < ApplicationController
  def index
    @applicant = Applicant.new
  end
end
