class Category < ApplicationRecord
  has_many :foodstuffs

  validates :name, presence: true
end
