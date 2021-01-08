class CreateMasterMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :master_menus do |t|
      t.integer :master_dish_id
      t.integer :menu_genre_id
      t.string :name
      t.string :image_id
      t.integer :count

      t.timestamps
    end
  end
end
