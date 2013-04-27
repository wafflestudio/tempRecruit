class ApplicationForm < ActiveRecord::Base
  attr_accessible :applicant_id

  belongs_to :applicant
end

