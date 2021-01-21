class MasterMenu < ApplicationRecord
  belongs_to :menu_genre
  has_many :master_menu_recipes, dependent: :destroy
  has_many :master_dishes, through: :master_menu_recipes
  accepts_nested_attributes_for :master_menu_recipes

  attachment :image
end
