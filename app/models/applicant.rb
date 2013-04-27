class Applicant < ActiveRecord::Base
  attr_accessible :department, :email, :name, :university, :year, :password, :password_confirmation, :period_id

  has_secure_password
  has_many :answers
  belongs_to :period
  has_one :application_form

end
