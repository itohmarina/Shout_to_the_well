class CreateSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggestions do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
