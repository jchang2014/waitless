class AddTimerToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :timer, :integer, default: 0
  end
end
