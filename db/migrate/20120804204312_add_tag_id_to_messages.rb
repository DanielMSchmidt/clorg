class AddTagIdToMessages < ActiveRecord::Migration
  def self.up
  	add_column :messages, :tag_id, :integer
  end
  def self.down
    remove_column :messages, :tag_id
  end
end
