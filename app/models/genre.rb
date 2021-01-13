class Genre < ApplicationRecord
  has_many :post_dishes
  has_many :master_dishes
  has_many :post_dishes

  validates :name, presence: true 
end
