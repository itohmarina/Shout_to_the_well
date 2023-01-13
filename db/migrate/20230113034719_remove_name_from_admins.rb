class RemoveNameFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :name, :string
  end
end
