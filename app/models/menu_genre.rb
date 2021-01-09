class MenuGenre < ApplicationRecord
  has_many :post_menus
  has_many :master_menus

  validates :name, presence: true
end
