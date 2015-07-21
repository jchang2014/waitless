class Reservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :restaurant

  def update_times
    self.table_ready_time = self.created_at + 15.minutes
    self.notify_time = self.table_ready_time - 5.minutes
    self.save
  end

  def notify_now?
    get_diff <= 5
  end

  #run sidekiq if notify_now?



  private
    def get_diff
      self.notify_time - Time.now)/3600
    end
end
