class MasterDish < ApplicationRecord
  belongs_to :genre
  has_many :dish_foodstuffs, dependent: :destroy
  accepts_nested_attributes_for :dish_foodstuffs, reject_if: :all_blank, allow_destroy: true
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

  validates :genre_id, :name, :recipe, :count, presence: true
  validates :count, numericality: {greater_than_or_equal_to: 1}

end
