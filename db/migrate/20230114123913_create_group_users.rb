class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.boolean :request_is_accepted, null: false, default: false

      t.timestamps
    end
  end
end
