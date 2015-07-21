class CreateReservations < ActiveRecord::Migration
  def change
    create_table   :reservations do |t|
    	t.integer    :number_in_party
    	t.integer    :timers
    	t.references :user, index:true
    	t.references :restaurant, index:true

      t.timestamps null: false
    end
  end
end
