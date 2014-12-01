class AddSortToVideosAndPhotos < ActiveRecord::Migration
  def change
    add_column :videos, :sort, :integer
    add_column :photos, :sort, :integer
  end
end
