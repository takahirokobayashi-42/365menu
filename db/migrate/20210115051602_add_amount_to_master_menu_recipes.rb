class AddAmountToMasterMenuRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :master_menu_recipes, :amount, :string
  end
end
