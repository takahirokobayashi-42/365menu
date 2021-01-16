class AddMasterToMasterDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :master_dishes, :is_master, :boolean, deafult: true
  end
end
