class DropTablePostDishes < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_dishes
  end
end
