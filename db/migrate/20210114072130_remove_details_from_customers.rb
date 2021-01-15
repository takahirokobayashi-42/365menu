class RemoveDetailsFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :last_name, :string
    remove_column :customers, :first_name, :string
    remove_column :customers, :kana_last_name, :string
    remove_column :customers, :kana_first_name, :string
  end
end
