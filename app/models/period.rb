class Period < ActiveRecord::Base
  attr_accessible :due_date, :start_date, :id
  has_many :questions
  has_many :applicants

  scope :current_period, lambda { where("due_date > ?", Time.zone.now ) }

  def self.end_current_period
    c = current_period.first
    c.due_date = Time.now - 1.week
    c.save    
  end

end
