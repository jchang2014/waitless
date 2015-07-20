class User < ActiveRecord::Base
  has_secure_password

  has_many :reservations
  has_many :restaurants

  validates :name, presence: true
  validates :email, presence: true
  validates :password, :presence => true, :length => {:within => 3..40}, :confirmation => true

end
