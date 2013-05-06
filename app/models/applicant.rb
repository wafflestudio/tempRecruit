class Applicant < ActiveRecord::Base
  attr_accessible :department, :email, :name, :university, :year, 
    :password, :password_confirmation, :cell_phone

  has_secure_password

  belongs_to :period
  has_one :application_form, dependent: :destroy
#  has_many :answers, through: :application_form

  validates_presence_of :name, :email, :year, :university, :department, :cell_phone
  validates_presence_of :period

  def complete!
    self.update_attribute(:status, "COMPLETE")
  end

  def answers
    application_form.answers
  end

  scope :in_progress, where("applicants.status = ?", "INCOMPLETE")
  scope :complete, where("applicants.status = ?", "COMPLETE")
#  scope :current_period, where("period_id = ?", Period.current_period.first.id)

end
