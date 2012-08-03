class CreateMessageTagAssignments < ActiveRecord::Migration
  def change
    create_table :message_tag_assignments do |t|
      t.integer :message_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :message_tag_assignments, :message_id
    add_index :message_tag_assignments, :tag_id
  end
end
