class RenameTimersToTimerInReservations < ActiveRecord::Migration
  def change
  	rename_column :reservations, :timers, :timer
  end
end
