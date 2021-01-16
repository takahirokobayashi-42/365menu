class RenamePostDishesIdColumnToPostComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_comments, :post_dishes_id, :master_dish_id
  end
end
