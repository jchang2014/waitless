class RemoveLocationFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :location, :text
  end
end
