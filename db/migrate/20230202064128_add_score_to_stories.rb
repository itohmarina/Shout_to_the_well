class AddScoreToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :score, :decimal, precision: 5, scale: 3
  end
end
