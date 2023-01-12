class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false, index:{ unique: true }
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
