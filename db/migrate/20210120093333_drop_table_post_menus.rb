class DropTablePostMenus < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_menus
  end
end
