class AddSummaryToNews < ActiveRecord::Migration
  def change
    add_column :news, :summary, :string
    add_column :news, :video, :string
  end
end
