class AddPublishedAtToNews < ActiveRecord::Migration
  def change
    add_column :news, :published_at, :datetime
    add_column :news, :source, :string
    add_column :news, :star, :integer
  end
end
