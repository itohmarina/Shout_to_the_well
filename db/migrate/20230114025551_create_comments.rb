class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
