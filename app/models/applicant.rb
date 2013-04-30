class Applicant < ActiveRecord::Base
  attr_accessible :department, :email, :name, :university, :year, 
    :password, :password_confirmation, :period_id, :cell_phone

  has_secure_password
  has_many :answers
  belongs_to :period
  has_one :application_form, dependent: :destroy


  validates_presence_of :name, :email, :year, :department, :cell_phone

end
