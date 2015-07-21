class Reservation < ActiveRecord::Base
  after_save   :update_times
	belongs_to   :user
	belongs_to   :restaurant

  def update_times
    update_column(:table_ready_time, (self.created_at + 15.minutes))
    update_column(:notify_time, (self.table_ready_time - 5.minutes))
    update_column(:notified?, false)
    update_column(:table_ready?, false)
  end

end
