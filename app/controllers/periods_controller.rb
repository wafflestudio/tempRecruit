class PeriodsController < ApplicationController

  before_filter :authenticate_admin

  def create
    period = Period.new(params[:period])
    if period.save
      flash[:notice] = "New Application Period successfully created"
      redirect_to admin_root_path
    end
  end

  def end_current_period
    if Period.end_current_period
      flash[:notice] = "Period Successfully ended"
      redirect_to admin_root_path
    else
      flash[:alert] = "An Error occurred"
      redirect_to admin_root_path
    end
  end

  def update
  end
end
