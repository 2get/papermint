class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  has_many :tasks, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email,
    presence: true,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    Task.from_tasks_priority_by(self, 4)
  end

  def feed_1
    Task.from_tasks_priority_by(self, 1)
  end

  def feed_2
    Task.from_tasks_priority_by(self, 2)
  end

  def feed_3
    Task.from_tasks_priority_by(self, 3)
  end

  def feed_4
    Task.from_tasks_priority_by(self, 4)
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
