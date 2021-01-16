class AddDetailsToMasterMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :master_menus, :customer_id, :interger
  end
end
