class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :userid
      t.text :message
      t.integer :conversationid

      t.timestamps
    end
  end
end
