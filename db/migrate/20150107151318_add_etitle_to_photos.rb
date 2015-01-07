class AddEtitleToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :etitle, :string
  end
end
