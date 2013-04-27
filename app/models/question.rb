class Question < ActiveRecord::Base
  attr_accessible :content, :period_id, :type
  has_many :answers
  belongs_to :period

end
