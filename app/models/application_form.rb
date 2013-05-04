class ApplicationForm < ActiveRecord::Base
  
  ACCEPTABLE_CATEGORIES = [
    'DESIGNER',
    'DEVELOPER',
    'PLANNER'
  ]
  
  attr_accessible :category, :period_id

  belongs_to :applicant
  belongs_to :period
  has_many :answers
  validate :category, inclusion: { in: ACCEPTABLE_CATEGORIES }

#  accepts_nested_attributes_for :answers

  def questions
    period.questions
  end

end

