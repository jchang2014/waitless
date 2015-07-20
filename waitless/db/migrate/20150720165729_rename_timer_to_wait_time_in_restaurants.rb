class RenameTimerToWaitTimeInRestaurants < ActiveRecord::Migration
  def change
  	rename_column :restaurants, :timer, :wait_time
  end
end
