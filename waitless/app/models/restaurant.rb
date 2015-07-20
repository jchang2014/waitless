class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :restaurant_types
	has_many :types, through: :restaurant_types

  validates :yelp_id, uniqueness: true
end
