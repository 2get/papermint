class Task < ActiveRecord::Base
  attr_accessible :content, :limit_date, :priority
  belongs_to :user

  after_initialize :set_default_params

  validates :content, presence: true, length: { maximum: 45 }
  validates :user_id, presence: true

  default_scope order: 'tasks.limit_date is null ASC, tasks.limit_date ASC,  tasks.created_at DESC'

  def set_default_params
    self.priority = self.priority || 1
  end

  def self.from_tasks_priority_by(user, priority = nil)
    if priority.nil?
      where(user_id: user.id)
    else
      where(user_id: user.id, priority: priority)
    end
  end
end
