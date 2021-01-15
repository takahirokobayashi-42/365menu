class MasterMenu < ApplicationRecord
  belongs_to :menu_genre
  has_many :master_menu_recipes, dependent: :destroy
  accepts_nested_attributes_for :master_menu_recipes

  attachment :image
end
