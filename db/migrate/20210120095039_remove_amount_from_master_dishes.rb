class RemoveAmountFromMasterDishes < ActiveRecord::Migration[5.2]
  def change
    remove_column :master_dishes, :amount, :integer
  end
end
