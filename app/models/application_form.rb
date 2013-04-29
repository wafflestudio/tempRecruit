class ApplicationForm < ActiveRecord::Base
  
  ACCEPTABLE_CATEGORIES = [
    'DESIGNER',
    'DEVELOPER',
    'PLANNER'
  ]
  
  attr_accessible :applicant_id, :category

  belongs_to :applicant
  
  validate :category, inclusion: { in: ACCEPTABLE_CATEGORIES }


end

