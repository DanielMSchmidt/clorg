class AddLocationToUser < ActiveRecord::Migration
   def self.up
  	add_column :users, :phone, :string
  	add_column :users, :street, :string
  	add_column :users, :zip, :string
  	add_column :users, :location, :string
  end
  def self.down
    remove_column :users, :phone
  	remove_column :users, :street
  	remove_column :users, :zip
  	remove_column :users, :location
  end
end
