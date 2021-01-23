class DishFoodstuff < ApplicationRecord
  belongs_to :master_dish
  belongs_to :foodstuff
end
