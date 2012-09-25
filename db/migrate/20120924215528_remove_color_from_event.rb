class RemoveColorFromEvent < ActiveRecord::Migration
  def up
  	remove_column :users, :color
  end

  def down
  	add_column :users, :color, :string
  end
end
