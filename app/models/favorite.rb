class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :master_dish
end
