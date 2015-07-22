class Reservation < ActiveRecord::Base
  after_save     :update_times
  # after_save
	belongs_to      :user
	belongs_to      :restaurant

  def update_times
    update_column(:table_ready_time, (self.created_at + 6.minutes))
    update_column(:notify_time, (self.table_ready_time - 5.minutes))
    update_column(:notified?, false)
    update_column(:table_ready?, false)
  end

  def notify_now?
    get_diff <= 5 && self.notified? == false
  end

  def notification_delay
    (self.notify_time - self.created_at)/60
  end
end
