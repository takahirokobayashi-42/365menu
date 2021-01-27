class ChangeMasterMenuRecipesToAmount < ActiveRecord::Migration[5.2]
  def change
    change_column :master_menu_recipes, :amount, :float
  end
end
