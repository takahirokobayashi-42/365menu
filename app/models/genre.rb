class Genre < ApplicationRecord
  has_many :master_dishes
  
  validates :name, presence: true
end
