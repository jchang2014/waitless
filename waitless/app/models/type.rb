class Type < ActiveRecord::Base
	has_many :restaurant_types
	has_many :types, through: :restaurant_types
end
