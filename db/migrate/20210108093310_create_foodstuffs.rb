class CreateFoodstuffs < ActiveRecord::Migration[5.2]
  def change
    create_table :foodstuffs do |t|
      t.string :category_id
      t.string :name
      t.string :image_id
      t.integer :calory
      t.integer :protein
      t.integer :carbohydrate
      t.integer :fat

      t.timestamps
    end
  end
end
