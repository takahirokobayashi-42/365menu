class DishFoodstuff < ApplicationRecord
  belongs_to :master_dish
  belongs_to :foodstuff

  validates :master_dish_id, :foodstuff_id, :amount, presence: true
end
