class Period < ActiveRecord::Base
  attr_accessible :due_date, :start_date, :id
  has_many :questions
  has_many :periods

end
