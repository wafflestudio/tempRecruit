class Period < ActiveRecord::Base
  attr_accessible :due_date, :start_date, :name
  has_many :questions
  has_many :applicants
  has_many :application_forms

  scope :current_period, lambda { where("due_date > ?", Time.zone.now ) }

  def self.end_current_period
    c = current_period.first
    c.due_date = Time.now
    c.save    
  end

end
