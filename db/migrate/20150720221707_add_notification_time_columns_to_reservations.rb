class AddNotificationTimeColumnsToReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :table_ready_time, :time
  	add_column :reservations, :notify_time, :time 
  	add_column :reservations, :notified?, :boolean
  	add_column :reservations, :table_ready?, :boolean
  end
end
