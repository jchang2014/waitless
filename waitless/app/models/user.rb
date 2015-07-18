class User < ActiveRecord::Base
  has_many :reservations

  validates :password, length: { minimum: 1}, allow_nil: true
  has_secure_password
end
