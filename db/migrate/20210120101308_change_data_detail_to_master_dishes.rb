class ChangeDataDetailToMasterDishes < ActiveRecord::Migration[5.2]
  def change
    change_column :master_dishes, :total_calory, :integer, default: 0
    change_column :master_dishes, :total_protein, :integer, default: 0
    change_column :master_dishes, :total_fat, :integer, default: 0
    change_column :master_dishes, :total_carbohydrate, :integer, default: 0
  end
end
