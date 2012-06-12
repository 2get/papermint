class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  has_secure_password

  has_many :tasks
end
