class ChangeIsMasterOfMasterDishes < ActiveRecord::Migration[5.2]
  def up
    change_column :master_dishes, :is_master, :boolean, default: 'true'
  end

  def down
    change_column :master_dishes, :is_master, :boolean
  end
end
