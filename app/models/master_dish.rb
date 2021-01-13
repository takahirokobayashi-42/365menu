class MasterDish < ApplicationRecord
  belongs_to :genre
  belongs_to :foodstuff, dependent: :destroy
  accepts_nested_attributes_for :master_dishes

  attachment :image

end
