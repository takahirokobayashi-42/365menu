class DishFoodstuff < ApplicationRecord
  belongs_to :master_dish
  belongs_to :foodstuff

  validates :amount, :foodstuff_id, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
