class User < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
