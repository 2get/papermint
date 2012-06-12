class Task < ActiveRecord::Base
  attr_accessible :content, :limit_date, :priority, :user_id

  belongs_to :user

  validates :content, :length => { :maximum => 255 }
end
