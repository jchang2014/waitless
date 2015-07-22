class AddAdminAndProprietorToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :proprietor, :boolean
  end
end
