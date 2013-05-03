class Answer < ActiveRecord::Base
  attr_accessible :application_form_id, :content, :question_id, :applicant_id

  belongs_to :application_form
  belongs_to :applicant
  belongs_to :question

end
