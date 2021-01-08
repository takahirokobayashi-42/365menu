class CreatePostMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :post_menus do |t|
      t.integer :customer_id
      t.integer :post_dish_id
      t.integer :menu_genre_id
      t.string :name
      t.integer :count
      t.string :image_id

      t.timestamps
    end
  end
end
