class AddEtitleToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :etitle, :string
  end
end
