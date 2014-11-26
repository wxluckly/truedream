class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  :title
      t.string  :content
      t.string  :cover
      t.string  :photo
      t.timestamps
    end
  end
end
