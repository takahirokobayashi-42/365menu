class CreateDishFoodstuffs < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_foodstuffs do |t|
      t.references :master_dish, foreign_key: true
      t.integer    :foodstuff_id
      t.integer    :amount
      t.timestamps

      t.timestamps
    end
  end
end
