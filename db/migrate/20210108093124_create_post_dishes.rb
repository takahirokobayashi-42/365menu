class CreatePostDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_dishes do |t|
      t.integer :customer_id
      t.integer :foodstuff_id
      t.integer :genre_id
      t.string :name
      t.integer :amount
      t.integer :count
      t.string :image_id
      t.text :recipe
      t.integer :total_calory
      t.integer :total_fat
      t.integer :total_carbohydrate
      t.integer :total_protein

      t.timestamps
    end
  end
end
