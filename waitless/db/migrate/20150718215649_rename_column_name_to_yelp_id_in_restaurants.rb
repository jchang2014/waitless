class RenameColumnNameToYelpIdInRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :name, :yelp_id
  end
end
