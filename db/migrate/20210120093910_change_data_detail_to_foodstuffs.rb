class ChangeDataDetailToFoodstuffs < ActiveRecord::Migration[5.2]
  def change
     change_column :foodstuffs, :calory, :float
     change_column :foodstuffs, :protein, :float
     change_column :foodstuffs, :fat, :float
     change_column :foodstuffs, :carbohydrate, :float
  end
end
