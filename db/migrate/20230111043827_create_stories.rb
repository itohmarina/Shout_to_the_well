class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :is_private, null: false, default: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
