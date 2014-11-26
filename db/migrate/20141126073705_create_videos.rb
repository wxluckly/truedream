class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string  :title
      t.string  :content
      t.string  :cover
      t.string  :video
      t.timestamps
    end
  end
end
