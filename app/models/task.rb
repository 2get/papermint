class Task < ActiveRecord::Base
  attr_accessible :content, :limit_date, :priority
  belongs_to :user

  validates :content, presence: true, :length => { :maximum => 255 }
  validates :user_id, presence: true

  default_scope order: 'tasks.created_at DESC'
end
