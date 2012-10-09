class DeleteTags < ActiveRecord::Migration
  def up
    drop_table :tags
  end

  def down
    create_table :tags do |t|
      t.string  :name
      t.string  :color
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end