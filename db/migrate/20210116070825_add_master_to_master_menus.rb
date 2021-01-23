class AddMasterToMasterMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :master_menus, :is_master, :boolean
  end
end
