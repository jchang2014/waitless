class CreateRestaurantTypes < ActiveRecord::Migration
  def change
    create_table :restaurant_types do |t|
      t.integer  :restaurant_id
      t.integer  :type_id
    end
  end
end
