class Question < ActiveRecord::Base
  
  default_scope order("priority")


  attr_accessible :content, :period_id, :answer_type, :priority
  has_many :answers
  belongs_to :period

  validates_presence_of :period, :answer_type, :content

  
  scope :current_period_questions, lambda { where("period_id = ?", Period.current_period.first.id) }


end
