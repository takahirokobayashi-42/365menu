class CreateMasterDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :master_dishes do |t|
      t.integer :foodstuff_id
      t.integer :Genre_id
      t.string :name
      t.string :image_id
      t.text :recipe
      t.integer :amount
      t.integer :count
      t.integer :total_calory
      t.integer :total_fat
      t.integer :total_carbohydrate
      t.integer :total_protein

      t.timestamps
    end
  end
end
