class Task < ActiveRecord::Base
  attr_accessible :content, :limit_date, :priority
  belongs_to :user

  after_initialize :set_default_params

  validates :content, presence: true, :length => { :maximum => 255 }
  validates :user_id, presence: true

  default_scope order: 'tasks.created_at DESC'

  def set_default_params
    self.priority = self.priority || 0
  end
end
