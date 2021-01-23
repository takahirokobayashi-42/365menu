class ChangeIsMasterOfMasterMenus < ActiveRecord::Migration[5.2]
  def up
    change_column :master_menus, :is_master, :boolean, default: 'open'
  end

  def down
    change_column :master_menus, :is_master, :boolean
  end
end
