class Reservation < ActiveRecord::Base
<<<<<<< HEAD
  after_save   :update_times
	belongs_to   :user
	belongs_to   :restaurant
=======


  after_save     :update_times
  # after_save
	belongs_to      :user
	belongs_to      :restaurant
>>>>>>> setup mailer with sidekiq

  def update_times
    update_column(:table_ready_time, (self.created_at + 15.minutes))
    update_column(:notify_time, (self.table_ready_time - 5.minutes))
    update_column(:notified?, false)
    update_column(:table_ready?, false)
  end
<<<<<<< HEAD
=======

  def notify_now?
    get_diff <= 5 && self.notified? == false
  end

  #run sidekiq if notify_now?
  # NotifyUsersWorker.perform_async('bob', 5)


  private
    def get_diff
      (self.notify_time - Time.now)/3600
    end
>>>>>>> setup mailer with sidekiq
end
