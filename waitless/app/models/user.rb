class User < ActiveRecord::Base
  has_secure_password

  has_many :reservations

  validates :name, presence: true
  validates :email, presence: true

end
