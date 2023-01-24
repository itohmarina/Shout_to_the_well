class AddSummaryToStory < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :summary, :string
  end
end
