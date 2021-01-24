class Foodstuff < ApplicationRecord
  belongs_to :category
  has_many :post_dishes
  has_many :dish_foodstuffs
  
  validates :category_id, :name, :calory, :fat, :protein, :carbohydrate, presence: true

end
