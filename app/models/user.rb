class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password
  has_many :photos
  has_many :comments
end
