class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string   :name
    	t.string   :email
    	t.string   :password_hash
    	t.string   :phone_number
      t.string   :uid
      t.string   :refresh_token
      t.string   :access_token
      t.string   :expires


      t.timestamps null: false
    end
  end
end
