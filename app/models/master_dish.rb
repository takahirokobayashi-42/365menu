class MasterDish < ApplicationRecord
  belongs_to :genre
  has_many :dish_foodstuffs, dependent: :destroy
  accepts_nested_attributes_for :dish_foodstuffs

  attachment :image

end
