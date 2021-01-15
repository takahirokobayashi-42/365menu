class RenameGenreIdColumnToMasterDishes < ActiveRecord::Migration[5.2]
  def change
     rename_column :master_dishes, :Genre_id, :genre_id
  end
end
