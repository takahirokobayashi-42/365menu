class AddDetailsToMasterDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :master_dishes, :customer_id, :interger
  end
end
