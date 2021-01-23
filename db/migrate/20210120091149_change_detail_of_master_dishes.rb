class ChangeDetailOfMasterDishes < ActiveRecord::Migration[5.2]
  def up
    change_column :master_dishes, :total_calory, :string, default: 0
    change_column :master_dishes, :total_protein, :string, default: 0
    change_column :master_dishes, :total_fat, :string, default: 0
    change_column :master_dishes, :total_carbohydrate, :string, default: 0
  end

  def down
    change_column :master_dishes, :total_calory, :string
    change_column :master_dishes, :total_protein, :string
    change_column :master_dishes, :total_fat, :string
    change_column :master_dishes, :total_carbohydrate, :string
  end
end