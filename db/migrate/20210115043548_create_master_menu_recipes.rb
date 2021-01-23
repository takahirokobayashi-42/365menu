class CreateMasterMenuRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :master_menu_recipes do |t|
      t.references :master_menu, foreign_key: true
      t.integer    :master_dish_id
      t.timestamps
    end
  end
end
