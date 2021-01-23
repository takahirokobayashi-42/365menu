class RemovePostDishIdFromDishFoodstuffs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dish_foodstuffs, :post_dish_id, :integer
  end
end
