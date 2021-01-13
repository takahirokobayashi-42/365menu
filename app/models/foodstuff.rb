class Foodstuff < ApplicationRecord
  belongs_to :category
  has_many :master_dishes, dependent: :destroy
  accepts_nested_attributes_for :master_dishes
  has_many :post_dish
  
  
end
