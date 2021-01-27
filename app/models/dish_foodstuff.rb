class DishFoodstuff < ApplicationRecord
  belongs_to :master_dish
  belongs_to :foodstuff

  validates :amount, :foodstuff_id, presence: true
end
