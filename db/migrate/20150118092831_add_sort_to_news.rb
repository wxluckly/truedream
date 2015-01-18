class AddSortToNews < ActiveRecord::Migration
  def change
    add_column :news, :sort, :integer
  end
end
