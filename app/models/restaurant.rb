class Restaurant < ActiveRecord::Base
	has_many :reservations
	belongs_to :user

  validates :yelp_id, uniqueness: true

  def update_wait_time
    self.update_attribute(:wait_time, (self.reservations.last.timer + 5))
  end
end
