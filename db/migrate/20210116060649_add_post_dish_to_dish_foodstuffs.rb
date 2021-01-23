class AddPostDishToDishFoodstuffs < ActiveRecord::Migration[5.2]
  def change
    add_column :dish_foodstuffs, :post_dish_id, :integer, foreign_key:true
  end
end
