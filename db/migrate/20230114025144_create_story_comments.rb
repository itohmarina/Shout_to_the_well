class CreateStoryComments < ActiveRecord::Migration[6.1]
  def change
    create_table :story_comments do |t|
      t.integer :user_id, null: false
      t.integer :story_id, null: false
      t.integer :comment_id, null: false

      t.timestamps
    end
  end
end
