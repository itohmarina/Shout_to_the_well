class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :owner_id, null: false
      t.string :name, null: false
      t.text :introduction
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
