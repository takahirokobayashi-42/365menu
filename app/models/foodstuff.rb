class Foodstuff < ApplicationRecord
  belongs_to :category
  has_many :post_dishes
  has_many :dish_foodstuffs


end
