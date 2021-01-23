class MasterDish < ApplicationRecord
  belongs_to :genre
  has_many :dish_foodstuffs, dependent: :destroy
  accepts_nested_attributes_for :dish_foodstuffs
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :master_menu_recipes
  has_many :master_menus, through: :master_menu_recipes

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  attachment :image
  
  def self.search(search, word)
    @master_dish = MasterDish.where("name LIKE?","%#{word}%") if name.present?
  end

end
