class ChangeDataAmountToDishFoodstuffs < ActiveRecord::Migration[5.2]
  def change
     change_column :dish_foodstuffs, :amount, :float
  end
end
